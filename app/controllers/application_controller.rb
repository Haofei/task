class ApplicationController < ActionController::Base
  
  before_filter :set_tracking_cookie
  
  def set_tracking_cookie
    cookies.permanent[:user_uuid] = SecureRandom.uuid unless cookies[:user_uuid]
  end
end
