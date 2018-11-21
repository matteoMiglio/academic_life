require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message_board = message_boards(:rdc)
    @post = posts(:recent)
    @user = users(:luca)
  end

  test "should get index" do
    get message_board_posts_url(@message_board)
    assert_response :success
  end

  #test "should get show" do
  #  get message_board_post_url(@message_board, @post)
  #  assert_response :success
  #end

  test "should get create" do
    assert_difference "Post.count" do
      post message_board_posts_url(@message_board), params: { post: { description: "Lorem Ipsum",
                                                                     user_id: @user.id,
                                                                     message_board_id: @message_board.id } }
    end
    assert_redirected_to message_board_url(@message_board)
  end

  test "should get destroy" do
    delete message_board_post_url(@message_board, @post)
    assert_redirected_to message_board_url(@message_board)
  end
end
