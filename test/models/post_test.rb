require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @post = Post.new(description: "Lorem ipsum", user_id: @user.id, message_board_id: @message_board.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "message_board id should be present" do
    @post.message_board_id = nil
    assert_not @post.valid?
  end

  test "description should be present" do
    @post.description = " "
    assert_not @post.valid?
  end

  test "description should be at most 255 characters" do
    @post.description = "a" * 256
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.ordered.first
  end

end
