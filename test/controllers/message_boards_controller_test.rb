require 'test_helper'

class MessageBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_board = message_boards(:rdc)
  end
 
  #test "should get show" do
  #  get message_board_url(@message_board)
  #  assert_response :success
  #end
end
