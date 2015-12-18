class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery
  include SessionsHelper

  protected

  def devise_sessions_controller
    if resource_class == User
      User::SessionsController.new(User, :user, params)
    else
      super # Use the default one
    end
  end
end
