class ApprovalsController < ApplicationController
  before_action :find_post

  def create
    if not already_approved?
      @approval = @post.approvals.create(user: current_user)
      if @approval
        redirect_to message_board_post_url(@post.message_board_id, @post)
      end
    end
  end

  def destroy
    if already_approved?
      @post.approvals.where(user: current_user).destroy_all
      redirect_to message_board_post_url(@post.message_board_id, @post)
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_approved?
    Approval.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
