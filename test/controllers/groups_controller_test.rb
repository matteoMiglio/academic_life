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

  test "should get show" do
    login(@user)
    get message_board_group_url(@message_board, @group)
    assert_response :success
  end

  test "should get create" do
    login(@user)
    assert_difference "Group.count" do
      post message_board_groups_url(@message_board), 
           params: { group: { name: "Lorem Ipsum" } }
    end
    assert_redirected_to message_board_groups_url(@message_board)
  end

  test "should get destroy" do
    login(@user)
    assert_difference 'Group.count', -1 do
      delete message_board_group_url(@message_board, @group)
    end
    assert_redirected_to message_board_groups_url(@message_board)
  end

  test "user can only index groups in his message boards" do
    login(@user)
    other_message_board = message_boards(:so)
    get message_board_groups_url(other_message_board)
    assert_response :redirect
    get errors_access_denied_url
    assert_response :success
  end

  test "user can only show groups in his message boards" do
    other_group = groups(:cesare)
    login(@user)
    get message_board_group_url(@message_board, other_group)
    assert_response :redirect
    get errors_record_not_found_url
    assert_response :success
  end

  test "user can only create groups in his message boards" do
    login(@user)
    other_message_board = message_boards(:so)
    assert_no_difference "Group.count" do
      post message_board_groups_url(other_message_board), 
           params: { group: { name: "Lorem Ipsum" } }
    end
    assert_response :redirect
    get errors_access_denied_url
    assert_response :success
  end

  test "user can only read groups which he belongs" do
    other_group = groups(:mahan)
    ability = Ability.new(@user)
    assert ability.can?(:destroy, @group)  
    assert ability.cannot?(:destroy, other_group) 
  end

  test "user can only destroy groups if he created them" do
    other_group = groups(:mahan)
    ability = Ability.new(@user)
    assert ability.can?(:destroy, @group)  
    assert ability.cannot?(:destroy, other_group)                                               
  end
end
