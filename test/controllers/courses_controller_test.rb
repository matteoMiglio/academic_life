require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest  
  setup do
    @user = users(:luca)
    @course = courses(:so)
    @message_board = @course.message_board
  end

  test "should get index" do
    get user_courses_url(@user)
    assert_response :success
  end

  test "should get show" do
    get user_course_url(@user, @course)
    assert_redirected_to message_board_posts_url(@course)
  end
end
