require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:luca)
    @ability = Ability.new(@user)
    @message_board = message_boards(:rdc)
    @lafayette = groups(:lafayette)
  end

  test "should get index" do
    login(@user)
    get message_board_group_members_url(@message_board, @lafayette)
    assert_response :success
  end

  test "should get create" do
    login(@user)
    giovanni = users(:giovanni)
    assert_difference "Member.count" do
      post message_board_group_members_url(@message_board, @lafayette), 
           params: { member: { user_id: giovanni.id } }
    end
    assert_redirected_to message_board_group_members_url(@message_board, @lafayette)
  end

  test "should get update" do
    login(@user)
    napoleone = groups(:napoleone)
    luca_napoleone = members(:luca_napoleone)
    patch message_board_group_member_url(@message_board, napoleone, luca_napoleone),
          params: { member: { membership: "member" } }
    assert_redirected_to message_board_group_url(@message_board, napoleone)
    luca_napoleone.reload
    assert_equal "member", luca_napoleone.membership
  end

  test "should get destroy (leave group)" do
    login(@user)
    mahan = groups(:mahan)
    luca_mahan = members(:luca_mahan)
    assert_difference 'Member.count', -1 do
      delete message_board_group_member_url(@message_board, mahan, luca_mahan)
    end
    assert_redirected_to message_board_groups_url(@message_board)
  end

  test "should get destroy (delete member)" do
    login(@user)
    dario_lafayette = members(:dario_lafayette)
    assert_difference 'Member.count', -1 do
      delete message_board_group_member_url(@message_board, @lafayette, dario_lafayette)
    end
    assert_redirected_to message_board_group_members_url(@message_board, @lafayette)
  end

  test "should get destroy (creator member)" do
    login(@user)
    luca_lafayette = members(:luca_lafayette)
    delete message_board_group_member_url(@message_board, @lafayette, luca_lafayette)
    assert_response :redirect
    assert_redirected_to message_board_group_url(@message_board, @lafayette)
  end

  test "user can only index members in his groups" do
    login(@user)
    cesare = groups(:cesare)
    get message_board_group_members_url(@message_board, cesare)
    assert_response :redirect
    get errors_record_not_found_url
    assert_response :success
  end

  test "user can only create members that they belong to his message boards" do
    login(@user)
    lucio = users(:lucio)
    assert_no_difference "Member.count" do
      post message_board_group_members_url(@message_board, @lafayette), 
           params: { member: { user_id: lucio.id } }
    end
    assert_response :redirect
    get errors_record_not_found_url
    assert_response :success
  end

  test "user can only create members when he is the creator" do
    mahan = groups(:mahan)
    assert @ability.can?(:create, Member.new(group_id: @lafayette.id))  
    assert @ability.cannot?(:create, Member.new(group_id: mahan.id))                                               
  end

  test "user can only delete member when he is the creator" do
    dario_lafayette = members(:dario_lafayette)
    giovanni_napoleone = members(:giovanni_napoleone)
    assert @ability.can?(:destroy, dario_lafayette)  
    assert @ability.cannot?(:destroy, giovanni_napoleone)                                               
  end

  test "user can only update members when he is invited" do
    luca_napoleone = members(:luca_napoleone)
    luca_mahan = members(:luca_mahan)
    assert @ability.can?(:update, luca_napoleone)  
    assert @ability.cannot?(:update, luca_mahan)                                          
  end

  test "user can only refuse an invite when he is invited" do
    luca_napoleone = members(:luca_napoleone)
    giovanni_napoleone = members(:giovanni_napoleone)
    assert @ability.can?(:destroy, luca_napoleone)  
    assert @ability.cannot?(:destroy, giovanni_napoleone )                                          
  end

  test "user can only leave group which he belongs" do
    luca_mahan = members(:luca_mahan)
    giovanni_napoleone = members(:giovanni_napoleone)
    assert @ability.can?(:destroy, luca_mahan)  
    assert @ability.cannot?(:destroy, giovanni_napoleone)                                               
  end
end
