require 'test_helper'

class ApprovalsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message_board = message_boards(:rdc)
    @user = users(:luca)
    @post1 = posts(:most_recent)
    @post2 = posts(:older)
    @approval = approvals(:one)
  end

  test "should create approval" do
    login(@user)
    assert_difference('Approval.count') do
      post post_approvals_url(@post1), params: { post: { user_id: @user.id,
                                                        post_id: @post1.id} }
    end
    assert_redirected_to message_board_post_url(@message_board, @post1)
  end


  test "should destroy approval" do
    login(@user)
    assert_difference 'Approval.count', -1 do
      delete post_approval_url(@post2, @approval)
    end
    assert_redirected_to message_board_post_url(@message_board, @post2)
  end
end
