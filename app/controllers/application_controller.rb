class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name ])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :biography, :type_of_dwelling, :outdoor_space, :other_pets, :children, :hours_alone, :previous_experience ])
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  # def default_url_options
  #   { host: ENV["happy-tails.fun"] || "localhost:3000" }
  # end

  def default_url_options
    if Rails.env.production?
      { host: "www.happy-tails.fun" }
    else
      { host: "localhost:3000" }
    end
  end
end
