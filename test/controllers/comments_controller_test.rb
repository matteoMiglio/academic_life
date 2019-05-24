require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @message_board = message_boards(:rdc)
    @post = posts(:recent)
    @user = users(:luca)
    @comment = comments(:example)
  end

  test "should get create" do
    login(@user)
    assert_difference "Comment.count" do
      post message_board_post_comments_url(@message_board, @post), 
           params: { comment: { description: "Lorem Ipsum" } }
    end
    assert_redirected_to message_board_post_url(@message_board, @post)
  end

  test "should get destroy" do
    login(@user)
    assert_difference 'Comment.count', -1 do
      delete message_board_post_comment_url(@message_board, @post, @comment)
    end
    assert_redirected_to message_board_post_url(@message_board, @post)
  end

  test "user can only comment in his message boards" do
    login(@user)
    mb = message_boards(:so)
    p_so = posts(:post_so)
    p_rdc = posts(:older)
    assert_no_difference "Comment.count" do
      post message_board_post_comments_url(@message_board, p_so), 
          params: { comment: { description: "Lorem Ipsum" } }
    end
  end
end
