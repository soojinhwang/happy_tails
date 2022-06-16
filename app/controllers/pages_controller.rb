class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  #   def profile
  #     @user = current_user
  #   end

  def my_pets
    @my_pets = current_user.shelter.pets
  end

  def my_applications
    @my_applications = current_user.applications
  end

end
