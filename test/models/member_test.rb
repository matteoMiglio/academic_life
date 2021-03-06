require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  def setup
    @user = users(:luca)
    @member = members(:luca_lafayette)
  end

  test "should be valid" do
    assert @member.valid?
  end

  test "membership should be present" do
    @member.membership = nil
    assert_not @member.valid?
  end

  test "membership should be 'udefined' or 'member' or 'creator'" do
    @member.membership = 'a'*6
    assert_not @member.valid? 
  end

  test "user id should be different in a group" do
    assert_not @user.members.build.valid?
  end
  
  test "user id should be present" do
    @member.user_id = nil
    assert_not @member.valid?
  end

  test "group id should be present" do
    @member.group_id = nil
    assert_not @member.valid?
  end
end