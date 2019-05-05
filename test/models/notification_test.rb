require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  def setup
    @user = users(:giovanni)
    @current_user = users(:luca)
    @comment = comments(:example)
    @notification = Notification.new(recipient_id: @user, actor_id: @current_user, 
                                     action: "comment", notifiable: @comment)
  end

  test "should be valid" do
    assert @notification.valid?
  end

  test "actor_id should be present" do
    @notification.actor_id = nil
    assert_not @notification.valid?
  end

  test "notifiable_id should be present" do
    @notification.notifiable_id = nil
    assert_not @notification.valid?
  end

  test "notifiable_type should be present" do
    @notification.notifiable_type = nil
    assert_not @notification.valid?
  end

end
