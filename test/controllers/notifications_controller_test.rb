require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:dario)
    @current_user = users(:luca)
    @comment = comments(:example)
    @comment_notification = Notification.create(recipient_id: @user.id, 
                                                actor_id: @current_user.id, 
                                                action: "ha commentato un tuo post.", 
                                                notifiable: @comment)

    @group = groups(:lafayette)
    @group_notification = Notification.create(recipient_id: @user.id, 
                                              actor_id: @current_user.id, 
                                              action: "ti ha invitato in un gruppo privato.", 
                                              notifiable: @group)
  end

  test "should get index" do
    login(@user)
    get notifications_url()
    assert_response :success
  end

  test "should get show comment's notification" do
    login(@user)
    get notification_url(@comment_notification)

    @post = @comment_notification.notifiable.post
    @msg_board = @post.message_board

    assert_instance_of(Comment, @comment_notification.notifiable)

    assert_redirected_to message_board_post_url(@msg_board, @post)

  end

  test "should get show group's notification" do
    login(@user)
    get notification_url(@group_notification)

    @g = @group_notification.notifiable
    @msg_board = @g.message_board

    assert_instance_of(Group, @group_notification.notifiable)
    
    assert_redirected_to message_board_group_url(@msg_board, @g)
  end

  test "should get destroy" do
    login(@user)
    assert_difference 'Notification.count', -1 do
      delete notification_url(@comment_notification)
    end
    assert_redirected_to notifications_url()
  end
end
