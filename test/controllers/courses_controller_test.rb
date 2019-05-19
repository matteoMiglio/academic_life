require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest  
  setup do
    @user = users(:luca)
    @course = courses(:rdc)
    @message_board = message_boards(:rdc)
  end

  test "should get index" do
    login(@user)
    get user_courses_url(@user)
    assert_response :success
  end

  test "should get show" do
    login(@user)
    get user_course_url(@user, @course)
    assert_redirected_to message_board_posts_url(@message_board)
  end
end
