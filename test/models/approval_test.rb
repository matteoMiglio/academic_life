require 'test_helper'

class ApprovalTest < ActiveSupport::TestCase
  def setup
    @user = users(:luca)
    @post = posts(:recent)
    @approval = Approval.new(user_id: @user.id, post_id: @post.id)
  end

  test "should be valid" do
    assert @approval.valid?
  end

  test "user id should be present" do
    @approval.user_id = nil
    assert_not @approval.valid?
  end

  test "post id should be present" do
    @approval.post_id = nil
    assert_not @approval.valid?
  end
end
