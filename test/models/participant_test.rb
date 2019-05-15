require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  def setup
    @user = users(:luca)
    @participant = participants(:luca)
    @member = participants(:giovanni)
    @creator = participants(:luca)
  end

  test "should be valid" do
    assert @participant.valid?
  end

  test "user_id should be present" do
    @participant.user_id = nil
    assert_not @participant.valid?
  end

  test "event_id should be present" do
    @participant.event_id = nil
    assert_not @participant.valid?
  end

  test "role should be present" do
    @participant.role = nil
    assert_not @participant.valid?
  end

  test "role must be 'creator' or 'member'" do
    @participant.role = 'a'*6
    assert_not @participant.valid?
  end
end
