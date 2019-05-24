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

  test "user can only create comments in his posts" do
    login(@user)
    other_post = posts(:post_so)
    assert_no_difference "Comment.count" do
      post message_board_post_comments_url(@message_board, other_post), 
          params: { comment: { description: "Lorem Ipsum" } }
    end
    assert_response :redirect
    get errors_record_not_found_url
    assert_response :success
  end

  test "user can only destroy his comments" do
    login(@user)
    other_comment = comments(:older)
    ability = Ability.new(@user)
    ability.can?(:destroy, @comment)
    ability.cannot?(:destroy, other_comment)
  end
end
