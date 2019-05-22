require 'test_helper'

class MessageBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_board = message_boards(:rdc)
    @user = users(:luca)
    @ability = Ability.new(@user)
  end
 
  test "user can only access to his message boards" do
    other_message_board = message_boards(:so)
    assert @ability.can?(:index, @message_board)
    assert @ability.cannot?(:index, other_message_board)                                               
  end
end
