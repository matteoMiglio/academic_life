require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @post = posts(:recent)
    @ability = Ability.new(@user)
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
      post message_board_posts_url(@message_board),
           params: { post: { description: "Lorem Ipsum" } }
    end
    assert_redirected_to message_board_posts_url(@message_board)
  end

  test "should get destroy" do
    login(@user)
    assert_difference 'Post.count', -1 do
      delete message_board_post_url(@message_board, @post)
    end
    assert_redirected_to message_board_posts_url(@message_board)
  end

  test "user can only index posts in his message boards" do
    other_message_board = message_boards(:so)
    login(@user)
    get message_board_posts_url(other_message_board)
    assert_response :redirect
    get errors_access_denied_url
    assert_response :success
  end

  test "user can only show posts in his message boards" do
    other_post = posts(:post_so)
    login(@user)
    get message_board_post_url(@message_board, other_post)
    assert_response :redirect
    get errors_record_not_found_url
    assert_response :success
  end

  test "user can only create posts in his message boards" do
    other_message_board = message_boards(:so)
    login(@user)
    assert_no_difference "Post.count" do
      post message_board_posts_url(other_message_board),
           params: { post: { description: "Lorem Ipsum" } }
    end
    assert_response :redirect
    get errors_access_denied_url
    assert_response :success
  end

  test "user can only destroy posts which they own" do
    other_post = posts(:older)
    ability = Ability.new(@user)
    assert ability.can?(:destroy, @post)  
    assert ability.cannot?(:destroy, other_post)                                               
  end
end
