require 'test_helper'

class UserGroupsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @group = groups(:lafayette)
  end

  test "should get index" do
    login(@user)
    get user_user_groups_url(@user)
    assert_response :success
  end

end
