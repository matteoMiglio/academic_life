class ApprovalsController < ApplicationController
  before_action :find_post

  def create
    if not already_approved?
      @approval = @post.approvals.create(user: current_user)
      if @approval.save
        redirect_to message_board_post_url(@post.message_board_id, @post)
      else
        flash[:error] = "Operazione non riuscita."
      end
    end
  end

  def destroy
    if already_approved?
      if not @post.approvals.where(user: current_user).destroy_all
        flash[:error] = "Operazione non riuscita."
      end
    end
    redirect_to message_board_post_url(@post.message_board_id, @post)
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
    end

    def already_approved?
      Approval.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
  
end
