class ApplicationsController < ApplicationController

  before_action :find_pet, only: [ :index, :edit, :create ]
  before_action :find_application, only: [ :edit, :show, :destroy, :update, :approve_application, :unapprove_application, :reject_application, :unreject_application]


  def index
    # @applications = Application.all
    @pets = Pet.all


  end

  def show

    @pet = @application.pet


    # if @application.approved = true
    #   @application.approved = false
    # else
    #   @application.approved = true
    # end

    # if @application.save!
    #   redirect_to application_path(@application)
    # else
    #   redirect_to application_path(@application), alert: @application.errors.full_messages
    # end

  end

  def create
    @application = Application.new
    @application.date = Time.now.to_date
    @application.approved = false
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
    @application.update(application_params)
    redirect_to applications_path(@application)
  end

  def destroy
    @pet = @application.pet
    @application.destroy
    redirect_to pet_path(@pet)
  end

  def approve_application
    @application.update(approved: true, reviewed: true)
  end

  def unapprove_application
    @application.update(approved: false, reviewed: false)
  end

  def reject_application
    @application.update(approved: false, reviewed: true)
  end

  def unreject_application
    @application.update(approved: false, reviewed: false)
  end

  private

  def find_pet

   @pet = Pet.find(params[:pet_id])

  end

  def find_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:approved)
  end

end
