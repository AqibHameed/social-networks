require 'test_helper'

class FriendShipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friend_ships_index_url
    assert_response :success
  end

  test "should get destroy" do
    get friend_ships_destroy_url
    assert_response :success
  end

end
