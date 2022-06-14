class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

<<<<<<< HEAD
#   def profile
#     @user = current_user
#   end
=======

>>>>>>> 24e8bd20c79b7c331c51ccaf5a29b92417c2e8a7
end
