require 'test_helper'

class ApprovalsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message_board = message_boards(:rdc)
    @user = users(:luca)
    @post1 = posts(:most_recent)
    @post2 = posts(:older)
    @approval_luca = approvals(:approval_luca)
  end

  test "should create approval" do
    login(@user)
    assert_difference('Approval.count') do
      post post_approvals_url(@post1), params: { post_id: @post1.id }
    end
    assert_redirected_to message_board_posts_url(@post1.message_board_id, anchor: @post1.id)
  end

  test "should destroy approval" do
    login(@user)
    assert_difference 'Approval.count', -1 do
      delete post_approval_url(@post2, @approval_luca)
    end
    assert_redirected_to message_board_posts_url(@post2.message_board_id, anchor: @post2.id)
  end

  test "user can only create approvals in his posts" do
    login(@user)
    other_post = posts(:post_so)
    assert_no_difference "Approval.count" do
      post post_approvals_url(@message_board, other_post)
    end
    assert_response :redirect
    get errors_record_not_found_url
    assert_response :success
  end

  test "user can only destroy his approvals" do
    login(@user)
    other_approval = approvals(:approval_giovanni)
    ability = Ability.new(@user)
    ability.can?(:destroy, @approval_luca)
    ability.cannot?(:destroy, other_approval)
  end
end
