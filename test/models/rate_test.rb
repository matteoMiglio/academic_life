require 'test_helper'

class RateTest < ActiveSupport::TestCase
  def setup
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @rate = Rate.new(grade: 28, user_id: @user.id, message_board_id: @message_board.id)
  end

  test "should be valid" do
    assert @rate.valid?
  end

  test "user_id should be present" do
    @rate.user_id = nil
    assert_not @rate.valid?
  end

  test "message_board_id should be present" do
    @rate.message_board_id = nil
    assert_not @rate.valid?
  end

  test "grade should be present" do
    @rate.grade = nil
    assert_not @rate.valid?
  end

  test "grade should be at most 31" do
    @rate.grade = 32
    assert_not @rate.valid?
  end

  test "grade should be at least 18" do
    @rate.grade = 17
    assert_not @rate.valid?
  end

end
