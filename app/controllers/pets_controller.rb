class PetsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_pet, only: [ :show, :edit, :update, :detroy ]

  def index
    if params[:query].present?
      @pets = Pet.where(name: params[:query])
    else
      @pets = Pet.all
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

  def edit; end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
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
                                :pet_friendly,
                                :outdoor_space,
                                :sex,
                                :age,
                                :colour,
                                :medical_conditions,
                                :hours_alone,
                                :children_friendly,
                                photos: [])
  end
end
