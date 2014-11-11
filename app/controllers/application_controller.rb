class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_tracking_cookie
  
  def set_tracking_cookie
    cookies.permanent[:user_uuid] = SecureRandom.uuid unless cookies[:user_uuid]
  end
end
