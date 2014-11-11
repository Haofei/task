class ActivitiesController < ApplicationController
  def create
    args = {status: params[:activities][:status], created_at: params[:activities][:time], path: params[:pageName]}
    
    if current_user
      args[:user_id] = current_user.id
    else
      guest = Guest.find_or_create_by(:uuid => cookies[:user_uuid])
      args[:guest_id] = guest.id
    end
    
    if Activity.create(args)
      active_time = current_user.try(:reload).try(:active_time) || guest.reload.active_time
      render json: {active_time: active_time}
    else
      head 500
    end
  end
  
  def user_count
    render :json => {"注册用户数" => User.online.length, "陌生用户" => Guest.online.length}
  end
end