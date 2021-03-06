require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @group = groups(:lafayette)
    @event = events(:evento_lafayette)
  end

  test "should get create" do
    login(@user)
    assert_difference "Event.count" do
      post message_board_group_events_url(@message_board, @group), 
            params: { event: { name: @event.name,
                               description: @event.description,
                               appointment: @event.appointment,
                               place: @event.place,
                               user: @user
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

  test "user can only create events in his groups" do
    login(@user)
    other_group = groups(:cesare)
    assert_no_difference "Event.count" do
      post message_board_group_events_url(@message_board, other_group), 
            params: { event: { name: @event.name,
                               description: @event.description,
                               appointment: @event.appointment,
                               place: @event.place,
                              } }
    end
    assert_response :redirect
    get errors_record_not_found_url
    assert_response :success
  end

  test "user can only destroy his events" do
    login(@user)
    other_event = events(:evento_napoleone)
    ability = Ability.new(@user)
    ability.can?(:destroy, @event)
    ability.cannot?(:destroy, other_event)
  end

end
