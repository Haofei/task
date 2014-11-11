class Guest < ActiveRecord::Base
  has_many :activities
  
  def self.online
    joins(:activities).where("activities.created_at >= ?", 1.minutes.ago).group("guests.id")
  end
end