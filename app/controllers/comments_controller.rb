class CommentsController < ApplicationController
  load_and_authorize_resource :message_board
  load_and_authorize_resource :post, through: :message_board
  load_and_authorize_resource :comment, through: :post

  def create
    @comment = @post.comments.build(description: comment_params[:description],
                                    user_id: current_user.id)
    if @comment.save
      flash[:success] = "Commento inserito!" 
      redirect_to :controller => 'posts', 
                  :action => 'show', 
                  :id => @post.id,
                  :message_board_id => @message_board.id
    else 
      flash[:danger] = "Commento non inserito!"
      redirect_to :controller => 'posts', 
                  :action => 'show', 
                  :id => @post.id,
                  :message_board_id => @post.message_board_id,
                  :errors => @comment.errors.full_messages
    end
  end

  def destroy
    @comment.destroy ? flash[:success] = "Commento eliminato!" 
                     : flash[:danger] = "Commento non eliminato!"
    redirect_to :controller => 'posts', 
                :action => 'show', 
                :id => @post.id,
                :message_board_id => @message_board.id
  end

  private
  
    def comment_params
      params.require(:comment).permit(:description)
    end
end
