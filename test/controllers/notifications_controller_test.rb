require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @notification = notifications(:group_notification)
    @user = users(:luca)
  end

  test "should get index" do
    login(@user)
    get notifications_url()
    assert_response :success
  end

  # test "should get show" do
  #   login(@user)

  #   assert_redirected_to message_board_groups_url(@notification)
  # end

  test "should get destroy" do
    login(@user)
    assert_difference 'Notification.count', -1 do
      delete notification_url(@notification)
    end
    assert_redirected_to notifications_url()
  end
end
