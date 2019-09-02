require 'test_helper'

class UserDocumentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @document = documents(:documento_luca)
  end

  test "should get index" do
    login(@user)
    get user_user_documents_url(@user)
    assert_response :success
  end

end
