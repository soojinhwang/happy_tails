class ApplicationsController < ApplicationController

  before_action :find_pet, only: [ :index, :create ]
  before_action :find_application, only: [ :show, :destroy, :approve_application, :unapprove_application, :reject_application, :unreject_application]


  def index
    @pets = Pet.all
  end

  def show
    @conversation = Conversation.create(name: "Conversation")
    @pet = @application.pet
    if @application.approved == true
      @application.pet.adoption_status = "Adopted"
    end
  end

  def create
    @application = Application.new
    @application.date = Time.now.to_date
    @application.approved = false
    @application.reviewed = false

    @pet = Pet.find(params[:pet_id])
    @application.pet = @pet
    @application.user = current_user
    if @application.save!
      redirect_to pet_path(@pet)
    else
      redirect_to pet_path(@pet), alert: @application.errors.full_messages
    end
  end


  def destroy
    @pet = @application.pet
    @application.destroy
    redirect_to pet_path(@pet)
  end

  def approve_application
    @application.update(approved: true, reviewed: true)
    redirect_to @application
  end

  def unapprove_application
    @application.update(approved: false, reviewed: false)
    redirect_to @application
  end

  def reject_application
    @application.update(approved: false, reviewed: true)
    redirect_to @application
  end

  def unreject_application
    @application.update(approved: false, reviewed: false)
    redirect_to @application
  end

  private

  def find_pet

   @pet = Pet.find(params[:pet_id])

  end

  def find_application
    @application = Application.find(params[:id])
  end


end
