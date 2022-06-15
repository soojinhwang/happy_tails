class ApplicationsController < ApplicationController

  before_action :find_pet, only: [ :create ]
  before_action :find_application, only: [ :destroy, :update]


  def index
    @applications = Application.all
    @pets = Pet.all
  end

  def create
    @application = Application.new
    @application.date = Time.now.to_date
    @application.approved = false


    @pet = Pet.find(params[:pet_id])
    @application.pet = @pet
    @application.user = current_user
    if @application.save!
      redirect_to pet_path(@pet)
    else
      redirect_to pet_path(@pet), alert: @application.errors.full_messages
    end
  end

  def edit

  end

  def update
    @application.update
    redirect_to pet_path() #not sure where to redirect to as update is done by shelter user

  end

  def destroy
    @pet = @application.pet
    @application.destroy
    redirect_to pet_path(@pet)
  end

  private

  def find_pet

   @pet = Pet.find(params[:pet_id])

  end

  def find_application
    @application = Application.find(params[:id])
  end

end
