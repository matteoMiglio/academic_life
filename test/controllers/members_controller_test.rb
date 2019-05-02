require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:luca)
    @user_to_invite = users(:giovanni)
    @message_board = message_boards(:rdc)
    @group = groups(:lafayette)
    @member = members(:luca)
    @user_leave = users(:dario)
    @member_leave = members(:dario)
  end

  test "should get index" do
    login(@user)
    get message_board_group_members_url(@message_board, @group)
    assert_response :success
  end

  test "should get create" do
    login(@user)
    assert_difference "Member.count" do
      post message_board_group_members_url(@message_board, @group), params: { member: { user_id: @user_to_invite.id } }
    end
    assert_redirected_to message_board_group_members_url(@message_board, @group)
  end

  test "should get destroy (leave group)" do
    login(@user_leave)
    assert_difference 'Member.count', -1 do
      delete message_board_group_member_url(@message_board, @group, @member_leave)
    end
    assert_redirected_to message_board_groups_url(@message_board)
  end

  test "should get destroy (delete member)" do
    login(@user)
    assert_difference 'Member.count', -1 do
      delete message_board_group_member_url(@message_board, @group, @member_leave)
    end
    assert_redirected_to message_board_group_members_url(@message_board, @group)
  end
end
