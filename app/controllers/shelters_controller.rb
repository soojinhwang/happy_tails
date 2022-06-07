class SheltersController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :set_shelter, only: [ :show, :edit, :update, :destroy ]

  def index
    @shelters = Shelter.all
  end

  #def show
  #end

  #def new
  #end

  #def update
  #end

  #def destroy
  #end

  #private

  #def set_shelter
    #@shelter = Shelter.find(params[:id])
  #end

  #def shelter_params
    #params.require(:shelter).permit(:name, :address)
  #end
end
