class CreateGuest < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :uuid
      t.integer :user_id
      t.integer  :active_time, default: 0
      t.timestamps
    end
    
    add_index :guests, :uuid,                unique: true
  end
end
