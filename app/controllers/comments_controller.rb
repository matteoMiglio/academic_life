class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build(comments_params)
    @comment.save ? flash[:success] = "Commento inserito!" 
                  : flash[:danger] = "Commento non inserito!"

    @message_board_id = Post.find(comments_params[:post_id]).message_board

    redirect_to :controller => 'posts', :action => 'show', 
                :id => comments_params[:post_id], #id del post
                :message_board_id => @message_board_id
  end

  def destroy
    @post_id = @comment.post_id
    @message_board_id = Post.find(@post_id).message_board
    @comment.destroy ? flash[:success] = "Commento eliminato!" 
                     : flash[:danger] = "Commento non eliminato!"

    redirect_to :controller => 'posts', :action => 'show', 
                :id => @post_id, #id del post
                :message_board_id => @message_board_id
  end

  private
  
    def comments_params
      params.require(:comment).permit(:description, :post_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])

      if @comment.nil?
        flash[:danger] = "Non puoi eliminare un commento scritto da un altro!"
        redirect_to request.referrer 
      end
    end
end
