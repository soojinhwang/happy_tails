class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @pets = Pet.where(adoption_status: "Available")
  end

  def my_pets
    # @my_pets = current_user.shelter.pets

    @my_pets = current_user.shelter.pets.order(
      Arel.sql(
        %q(
          CASE adoption_status
          WHEN 'Available' THEN 1
          WHEN 'Reserved'  THEN 2
          WHEN 'Adopted'  THEN 3
          END
        )
      )
    )

    @my_pets.each do |pet|
      pet.applications.any? do |application|
        if application.approved == true
          application.pet.adoption_status = "Adopted"
          pet.save!
        end
      end
    end

    @available_pets = @my_pets.where(adoption_status: "Available")
    @reserved_pets = @my_pets.where(adoption_status: "Reserved")
    @adopted_pets = @my_pets.where(adoption_status: "Adopted")
  end

  def my_applications
    @my_applications = current_user.applications

    @total_applications = @my_applications.count

    @successful_applications = []

    @application_in_progress = []

    @unsuccessful_applications = []

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
