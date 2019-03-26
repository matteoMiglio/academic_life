require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @post = posts(:recent)
  end

  test "should get index" do
    login(@user)
    get message_board_posts_url(@message_board)
    assert_response :success
  end

  test "should get show" do
    login(@user)
    get message_board_post_url(@message_board, @post)
    assert_response :success
  end

  test "should get create" do
    login(@user)
    assert_difference "Post.count" do
      post message_board_posts_url(@message_board), params: { post: { description: "Lorem Ipsum",
                                                                      message_board_id: @message_board.id } }
    end
    assert_redirected_to message_board_posts_url(@message_board)
  end

  test "should get destroy" do
    assert_difference 'Post.count', -1 do
      delete message_board_post_url(@message_board, @post)
    end
    assert_redirected_to message_board_posts_url(@message_board)
  end
end
