require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @group = groups(:lafayette)
  end

  test "should get index" do
    login(@user)
    get message_board_groups_url(@message_board)
    assert_response :success
  end

  test "shoul get show" do
    login(@user)
    get message_board_group_url(@message_board, @group)
    assert_response :success
  end
end
