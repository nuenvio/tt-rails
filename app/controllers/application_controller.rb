class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin_user!
    redirect_to new_user_session_path unless current_user.try(:is_admin?)
  end
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :about, :github, :twitter, :facebook, :avatar,:skype,:telegram])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :about, :github, :twitter, :facebook, :avatar,:skype,:telegram])
    end
end
