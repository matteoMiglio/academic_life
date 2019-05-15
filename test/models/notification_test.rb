require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  def setup
    @user = users(:dario)
    @current_user = users(:luca)
    @post = posts(:medium)
    @comment = Comment.new(description: "ciao", post_id: @post, user_id: @current_user)
    @notification = Notification.new(recipient_id: @user, actor_id: @current_user, 
                                     action: "ha commentato un tuo post.", notifiable: @comment)
  end

  test "should be valid" do
    assert @notification.valid?
  end

  test "actor_id should be present" do
    @notification.actor_id = nil
    assert_not @notification.valid?
  end

  test "notifiable should be present" do
    @notification.notifiable = nil
    assert_not @notification.valid?
  end

end
