class PetsController < ApplicationController
  def index
    if params[:query].present?
      @pets = Pet.where(name: params[:query])
    else
      @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
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
    params.require(:pet).permit(:adoption_status, :name, :species, :description, :location, :breed, :sex, :age, :colour, :medical_conditions,:hours_alone, :children_friendly )
  end
end
