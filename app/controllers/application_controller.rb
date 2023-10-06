class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_up_path_for(resource)
    dashboard_path # or wherever you want to redirect after sign up
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
  end
  def after_sign_in_path_for(resource)
    dashboard_path # Redirect to dashboard action in PagesController
  end
end
