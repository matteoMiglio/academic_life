require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = groups(:lafayette)
  end

  test "should be valid" do
    assert @group.valid?
  end

  test "name should be present" do
    @group.name = nil
    assert_not @group.valid?
  end

  test "name should be at most 100 characters" do
    @group.name = 'a'*101
    assert_not @group.valid?
  end

  test "name should be at least 5 characters" do
    @group.name = 'a'*4
    assert_not @group.valid?
  end

  test "state should be 'public' or 'private'" do
    @group.state = 'a'*6
    assert_not @group.valid?
  end

  test "message board id should be present" do
    @group.message_board_id = nil
    assert_not @group.valid?
  end
end
