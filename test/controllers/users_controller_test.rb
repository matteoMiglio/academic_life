require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:luca)
  end

  test "should get show" do
    get user_url(@user)
    assert_response :success
  end
end
