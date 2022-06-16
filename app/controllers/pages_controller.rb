class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end


  def my_applications
    @applications = Application.all

  end


  #   def profile
  #     @user = current_user
  #   end

end
