require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:luca)
    @post = posts(:most_recent)
    @comment = Comment.new(description: "Commento 1", user_id: @user.id, post_id: @post.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user_id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "post_id should be present" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "description should be present" do
    @comment.description = nil
    assert_not @comment.valid?
  end

  test "description should be at most 255 characters" do
    @comment.description = "a" * 256
    assert_not @comment.valid?
  end

  test "order should be older first" do
    assert_equal comments(:older), Comment.ordered.first
  end
end
