require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @review = reviews(:luca)
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @duplicate_review = @user.reviews.build(feedback: "Test unicità",
                                            message_board_id: @message_board.id)
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test "message board id should be present" do
    @review.message_board_id = nil
    assert_not @review.valid?
  end

  test "feedback should be present" do
    @review.feedback = nil
    assert_not @review.valid?
  end

  test "feedback should be at most 500 characters" do
    @review.feedback = 'a' * 501
    assert_not @review.valid?
  end

  test "feedback should be at least 5 characters" do
    @review.feedback = 'a' * 4
    assert_not @review.valid?
  end

  test "(user id, message board id) should be present at most once" do
    assert_not @duplicate_review.valid?
  end
end
