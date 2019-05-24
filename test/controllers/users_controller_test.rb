require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:luca)
  end

  test "should get show" do
    login(@user)
    get user_url(@user)
    assert_response :success
  end

  test "user can only show his profile" do
    other_user = users(:giovanni)
    ability = Ability.new(@user)
    ability.can?(:show, @user)
    ability.cannot?(:show, other_user)
  end
end
