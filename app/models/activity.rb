class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :guest
  
  after_create do
    if ["idle", "close"].include? status
      if user_id
        last_active = Activity.order("created_at desc").find_by(user_id: user_id, status: 'active')
        user.active_time = created_at - last_active.created_at + user.active_time
        user.save
      else
        last_active = Activity.order("created_at desc").find_by(guest_id: guest_id, status: 'active')
        guest.active_time = created_at - last_active.created_at + guest.active_time
        guest.save
      end
    end
  end
end