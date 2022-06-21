class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_pet, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:query].present?
      @pets = Pet.where(name: params[:query])

      @pets.each do |pet|
        pet.applications.any? do |application|
           if application.approved == true
            application.pet.adoption_status = "Adopted"
           end
        end
     end

    else
      @pets = Pet.all

       @pets.each do |pet|
         pet.applications.any? do |application|
            if application.approved == true
             application.pet.adoption_status = "Adopted"
            end
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
                                :hours_alone,
                                :other_cats,
                                :other_dogs,
                                photos: [])
  end
end
