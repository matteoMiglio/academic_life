require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @message_board = message_boards(:rdc)
    @post = posts(:recent)
    @user = users(:ben)
    @comment = comments(:example)
  end

  test "should get create" do
    login(@user)
    assert_difference "Comment.count" do
      post comments_url, params: { comment: { description: "Lorem Ipsum",
                                              post_id: @post.id } }
    end
    assert_redirected_to message_board_post_url(@message_board, @post)
  end

  test "should get destroy" do
    login(@user)
    delete comment_url(@comment)
    assert_redirected_to message_board_post_url(@message_board, @post)
  end
end