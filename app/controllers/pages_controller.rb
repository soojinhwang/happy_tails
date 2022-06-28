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

    @total_applications = @my_applications.count

    @successful_applications = []

    @application_in_progress = []

    @unsccessful_applications = []

    @my_applications.each do |application|
      if application.approved == true && application.reviewed == true
        @successful_applications.push(application)
      elsif application.approved == false && application.reviewed == false
        @application_in_progress.push(application)
      else application.approved == false && application.reviewed == true
        @unsuccessful_applications.push(application)
      end
    end
  end
end
