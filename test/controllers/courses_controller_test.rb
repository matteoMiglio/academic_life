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

  test "user can only index his courses" do
    other_user = users(:giovanni)
    login(@user)
    get user_courses_url(other_user)
    assert_response :redirect
    get errors_access_denied_url
    assert_response :success
  end

  test "user can only show his courses" do
    other_course = courses(:so)
    login(@user)
    get user_course_url(@user, other_course)
    assert_response :redirect
    get errors_record_not_found_url
    assert_response :success
  end
end
