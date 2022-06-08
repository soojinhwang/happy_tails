class SheltersController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shelter, only: [ :show ]

  def index
    @shelters = Shelter.all

  end


  def show

  end


  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.user = current_user

    if @shelter.save
      redirect_to shelter_path(@shelter)
    else
      render :new
    end

  end


  private

  def set_shelter
    @shelter = Shelter.find(params[:id])
  end

  def shelter_params
    params.require(:shelter).permit(:name, :address)
  end
end
