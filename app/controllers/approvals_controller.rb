class ApprovalsController < ApplicationController
  before_action :find_post

  def create
    if not already_approval?
      if @post.approvals.create(user: current_user)
        redirect_to post_path(@post), :notice => 'Liked!'
      end
    end
  end

  def destroy
    if already_approval?
      @post.approvals.where(user: current_user).destroy_all
      redirect_to post_path(@post), notice => 'Unliked!'
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_approval?
    Approval.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
