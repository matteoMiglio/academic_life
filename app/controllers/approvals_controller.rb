class ApprovalsController < ApplicationController
  before_action :find_post
  before_action :find_approval, only: [:destroy]

    def create
      if not already_approval?
        @post.approvals.create(user_id: current_user.id)
        redirect_to post_path(@post)
      end
    end

    def destroy
      if already_approval?
        @approval.destroy
        redirect_to post_path(@post)
      end
    end

    private
    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_approval
      @approval = @post.approvals.find(params[:id])
    end

    def already_approval?
      Approval.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
end
