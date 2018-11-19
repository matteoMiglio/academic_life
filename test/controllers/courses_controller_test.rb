require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest  
  setup do
    @course = courses(:one)
    @message_board = @course.message_board
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get show" do
    get course_url(@course)
    assert_redirected_to message_board_url(@message_board)
  end
end
