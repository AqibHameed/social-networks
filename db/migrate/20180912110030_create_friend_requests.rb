class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.integer :user_id, index: true
      t.integer :friend_id, index: true

      t.timestamps
    end
  end
end
