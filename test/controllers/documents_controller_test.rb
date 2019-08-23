require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:luca)
    @message_board = message_boards(:rdc)
    @document = documents(:documento_luca)
    @category = categories(:appunti)
  end

  test "should get index" do
    login(@user)
    get message_board_documents_url(@message_board.id)
    assert_response :success
  end

  test "should get create" do
    login(@user)
    assert_difference "Document.count" do
      post message_board_documents_url(@message_board.id), 
           params: { document: { name: @document.name,
                                 description: @document.description,
                                 category_id: @category.id,
                                 message_board_id: @message_board.id
                               } }
    end
    assert_redirected_to message_board_documents_url(@message_board)
  end

  test "should get new" do
    login(@user)
    get new_message_board_document_url(@message_board.id)
    assert_response :success
  end

  test "should get destroy" do
    login(@user)
    assert_difference 'Document.count', -1 do
      delete message_board_document_url(@message_board.id, @document.id)
    end
    assert_redirected_to message_board_documents_url(@message_board)
  end

  test "user can only index documents in his message boards" do
    other_message_board = message_boards(:so)
    login(@user)
    get message_board_documents_url(other_message_board)
    assert_response :redirect
    get errors_access_denied_url
    assert_response :success
  end

  test "user can only create posts in his message boards" do
    other_message_board = message_boards(:so)
    login(@user)
    assert_no_difference "Document.count" do
      post message_board_documents_url(other_message_board), 
           params: { document: { name: @document.name,
                                 description: @document.description,
                                 category_id: @category.id,
                                 message_board_id: @message_board.id
                               } }
    end
    assert_response :redirect
    get errors_access_denied_url
    assert_response :success
  end

  test "user can only destroy documents which they own" do
    other_document = documents(:documento_giovanni)
    ability = Ability.new(@user)
    assert ability.can?(:destroy, @document)  
    assert ability.cannot?(:destroy, other_document)                                               
  end
end
