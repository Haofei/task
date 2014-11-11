class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  has_many :activities
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  def self.online
    joins(:activities).where("activities.created_at >= ?", 1.minutes.ago).group("users.id")
  end
end