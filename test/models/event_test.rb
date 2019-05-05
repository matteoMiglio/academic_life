require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @group = groups(:lafayette)
    @event = Event.new(name: "Progetto",
                        description: "Discussione casi d'uso",
                        appointment: "2019-05-05 16:06:45",
                        place: "Ingegneria",
                        group_id: @group.id)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "group id should be present" do
    @event.group_id = nil
    assert_not @event.valid?
  end

  test "name should be present" do
    @event.name = " "
    assert_not @event.valid?
  end

  test "name should be at most 100 characters" do
    @event.name = "a" * 101
    assert_not @event.valid?
  end

  test "description should be present" do
    @event.description = " "
    assert_not @event.valid?
  end

  test "description should be at most 300 characters" do
    @event.description = "a" * 301
    assert_not @event.valid?
  end

  test "appointment should be present" do
    @event.appointment = " "
    assert_not @event.appointment?
  end

  test "place should be present" do
    @event.place = " "
    assert_not @event.valid?
  end

  test "place should be at most 100 characters" do
    @event.place = "a" * 101
    assert_not @event.valid?
  end

end