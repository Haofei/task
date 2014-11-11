class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :guest_id
      t.string :path
      t.string :status
      t.datetime :created_at
    end
  end
end
