class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
end
