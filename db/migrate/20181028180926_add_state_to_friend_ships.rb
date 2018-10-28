class AddStateToFriendShips < ActiveRecord::Migration[5.2]
  def change
    add_column :friend_ships, :state, :string
  end
end
