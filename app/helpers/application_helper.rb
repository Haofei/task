module ApplicationHelper
  def active_time
    current_user.try(:active_time) or Guest.find_or_create_by(uuid: cookies[:user_uuid]).active_time
  end
end
