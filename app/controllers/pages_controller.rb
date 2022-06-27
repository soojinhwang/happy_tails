class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def my_pets
    @my_pets = current_user.shelter.pets
    @my_pets.each do |pet|
      pet.applications.any? do |application|
        if application.approved == true
          application.pet.adoption_status = "Adopted"
        end
      end
    end
  end

  def my_applications
    @my_applications = current_user.applications
  end
end
