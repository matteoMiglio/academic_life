require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(name: "Analisi 1", credit: 6, professor: "Nathan")
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "name should be present" do
    @course.name = ""
    assert_not @course.valid?
  end
 
  test "name should not be too long" do
    @course.name = "a" * 101
    assert_not @course.valid?
  end

  test "credit should be present" do
    @course.credit = nil
    assert_not @course.valid?
  end

  test "credit should be >= 0" do
    @course.credit = -4
    assert_not @course.valid?
  end

  test "credit should be integer" do
    @course.credit = 1.5
    assert_not @course.valid?
  end

  test "professor should be present" do
    @course.professor = ""
    assert_not @course.valid?
  end

  test "professor should not be too long" do
    @course.professor = "a" * 101
    assert_not @course.valid?
  end
end
