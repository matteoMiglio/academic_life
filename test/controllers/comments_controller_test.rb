require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @message_board = message_boards(:rdc)
    @post = posts(:recent)
    @user = users(:luca)
    @comment = comments(:example)
  end

  test "should get create" do
    assert_difference "Comment.count" do
      post comments_url, params: { comment: { description: "Lorem Ipsum",
                                                 #user_id: @user.id,
                                                 post_id: @post.id } }
    end
    assert_redirected_to message_board_post_url(@message_board, @post)
  end

  test "should get destroy" do
    delete comment_url(@comment)
    assert_redirected_to message_board_post_url(@message_board, @post)
  end
end
