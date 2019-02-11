class ApprovalsController < ApplicationController
  before_action :find_post

  def create
    if not already_approval?
      if @post.approvals.create(user: current_user)
        respond_to do |format|
          format.js
          format.html { redirect_to post_path(@post) }
        end
      end
    end
  end

  def destroy
    if already_approval?
      @post.approvals.where(user: current_user).destroy_all
      respond_to do |format|
        format.js
        format.html { redirect_to post_path(@post) }
      end
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
