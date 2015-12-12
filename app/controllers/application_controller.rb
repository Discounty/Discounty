class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  after_filter :store_location

  def store_location
    session[:previous_url] =
      request.fullpath if !request.fullpath.match('/customers') &&
                          !request.fullpath.match('/shops') && !request.xhr?
  end

  def after_sign_in_path_for(_resource)
    # session[:previous_url] || root_path
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :email
    devise_parameter_sanitizer.for(:sign_in) << :email
  end
end
