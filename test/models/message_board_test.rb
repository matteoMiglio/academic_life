require 'test_helper'

class MessageBoardTest < ActiveSupport::TestCase
  def setup
    @course = courses(:one)
    @message_board = @course.build_message_board
  end

  test "should be valid" do
    assert @message_board.valid?
  end

  test "course id should be present" do
    @message_board.course_id = nil
    assert_not @message_board.valid?
  end
end
