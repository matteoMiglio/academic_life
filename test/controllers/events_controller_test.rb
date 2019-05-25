require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @group = groups(:lafayette)
    @event = events(:evento)
  end

  test "should get create" do
    login(@user)
    assert_difference "Event.count" do
      post message_board_group_events_url(@message_board, @group), 
            params: { event: { name: @event.name,
                               description: @event.description,
                               appointment: @event.appointment,
                               place: @event.place,
                               group_id: @group.id 
                              } }
      end
    assert_redirected_to message_board_group_url(@message_board, @group)
  end

  test "should get new" do
    login(@user)
    get new_message_board_group_event_url(@message_board, @group)
    assert_response :success
  end

  test "should get destroy" do
    login(@user)
    assert_difference 'Event.count', -1 do
      delete message_board_group_event_url(@message_board, @group, @event)
    end
    assert_redirected_to message_board_group_url(@message_board, @group)
  end  

end
