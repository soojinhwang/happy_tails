class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_pet, only: [ :show, :edit, :update, :destroy ]

  def index

    @pets = Pet.all

    @pets = Pet.order(
      Arel.sql(
        %q(
          CASE adoption_status
          WHEN 'Available' THEN 1
          WHEN 'Reserved'  THEN 2
          WHEN 'Adopted'  THEN 3
          END
        )
      )
    )

      @pets = @pets.search_by_name_and_species(params[:query]) if params[:query].present?
      @pets = @pets.where("adoption_status =  ? ", params[:adoption_status]) if params[:adoption_status].present?
      @pets = @pets.where("species =  ? ", params[:species]) if params[:species].present?
      @pets = @pets.where("outdoor_space =  ? ", params[:outdoor_space]) if params[:outdoor_space].present?
      @pets = @pets.where("other_cats =  ? ", params[:other_cats]) if params[:other_cats].present?
      @pets = @pets.where("other_dogs =  ? ", params[:other_dogs]) if params[:other_dogs].present?
      @pets = @pets.where("children =  ? ", params[:children]) if params[:children].present?

      @pets.each do |pet|
        pet.applications.any? do |application|
           if application.approved == true
            application.pet.adoption_status = "Adopted"
            application.pet.save!
           end
        end
      end
  end

  def show
    @application = Application.new
    @user_has_applied = false
    @pet.applications.each do |application|
      if application.user == current_user
        @user_has_applied = true
        @user_application = application
      end
    end
    @pet.applications.any? do |application|
      if application.approved == true
        application.pet.adoption_status = "Adopted"
        application.pet.save!
      end
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.shelter = current_user.shelter
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pet.update(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:shelter_id,
                                :adoption_status,
                                :name,
                                :species,
                                :description,
                                :location,
                                :breed,
                                :outdoor_space,
                                :sex,
                                :age,
                                :colour,
                                :medical_conditions,
                                :children,
                                :hours_alone,
                                :other_cats,
                                :other_dogs,
                                photos: [])
  end
end
