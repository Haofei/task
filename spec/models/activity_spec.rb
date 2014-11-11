describe Activity do

  it "should update guest's active time" do
    guest = Guest.create(id: 1, uuid: 2)
    Activity.create(guest_id: guest.id, status: "active", created_at: Time.new(2001))
    Activity.create(guest_id: guest.id, status: "idle", created_at: Time.new(2002))
    expect(Guest.find(guest.id).active_time).to eq(31536000)
  end
  
  it "should updated user's active time" do
    user = User.create(id: 1)
    allow_any_instance_of(Activity).to receive(:user).and_return user
    Activity.create(user_id: user.id, status: "active", created_at: Time.new(2001))
    Activity.create(user_id: user.id, status: "idle", created_at: Time.new(2002))
    expect(user.active_time).to eq(31536000)
  end

end
