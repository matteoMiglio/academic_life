require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message_board = message_boards(:rdc)
    @user = users(:dario)
  end

  test "should get index" do
    login(@user)
    get message_board_reviews_url(@message_board)
    assert_response :success
  end

  test "should get create" do
    login(@user)
    assert_difference "Review.count" do
      post message_board_reviews_url(@message_board), params: { review: { feedback: "Opinione Test",
                                                                          message_board_id: @message_board.id } }
    end
    assert_redirected_to message_board_reviews_url(@message_board)
  end
end
