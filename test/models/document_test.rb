require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  def setup
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @category = categories(:appunti)
    @document = Document.new(name: "Doc", description: "Prova di documento", 
                             user_id: @user.id, message_board_id: @message_board.id,
                             category_id: @category.id)
  end

  test "should be valid" do
    assert @document.valid?
  end

  test "name should be present" do
    @document.name = nil
    assert_not @document.valid?
  end

  test "name should be at most 100 characters" do
    @document.name = "a" * 101
    assert_not @document.valid?
  end

  test "description should be present" do
    @document.description = nil
    assert_not @document.valid?
  end

  test "description should be at most 300 characters" do
    @document.description = "a" * 301
    assert_not @document.valid?
  end

  test "user id should be present" do
    @document.user_id = nil
    assert_not @document.valid?
  end

  test "message board id should be present" do
    @document.message_board_id = nil
    assert_not @document.valid?
  end

  test "category id should be present" do
    @document.category_id = nil
    assert_not @document.valid?
  end
end
