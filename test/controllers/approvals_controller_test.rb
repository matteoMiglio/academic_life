require 'test_helper'

class ApprovalsControllerTest < ActionDispatch::IntegrationTest
  def setup
    #@message_board = message_boards(:rdc)
    @user = users(:luca)
    @post = posts(:recent)
    @approval = approvals(:one)
  end

  test "should create approval" do
    login(@user)
    assert_difference('Approval.count') do
      post post_approvals_path(@post.id), params: { post: { user_id: @user.id,
                                                    post_id: @post.id} }
    end

    assert_redirected_to message_board_post_url(@post.message_board_id, @post)
  end


  #test "should destroy approval" do
  #  article = articles(:one)
  #  assert_difference('Article.count', -1) do
  #    delete article_url(article)
  #  end

  #  assert_redirected_to articles_path
  #end
end
