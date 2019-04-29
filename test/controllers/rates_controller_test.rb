require 'test_helper'

class RatesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message_board = message_boards(:rdc)
    @user = users(:luca)
  end

  test "should get index" do
    login(@user)
    get message_board_rates_url(@message_board)
    assert_response :success
  end

  test "should get create" do
    login(@user)
    assert_difference "Rate.count" do
      post message_board_rates_url(@message_board), params: { rate: { grade: 28,
                                                                      message_board_id: @message_board.id } }
    end
    assert_redirected_to message_board_rates_url(@message_board)
  end
end
