class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build(comments_params)

    if @comment.save
      flash[:success] = "Commento inserito!" 

      # Create the notification to the owner's post
      @post = @comment.post
      Notification.create(recipient: @post.user, 
                          actor: current_user, 
                          action: "ha commentato il tuo post.", 
                          notifiable: @comment)

      # Create the notifications
      @post.comments.group(:user_id).uniq.each do |comment|
        if comment.user != current_user
          Notification.create(recipient: comment.user, 
                              actor: current_user, 
                              action: "ha commentato un post nel quale sei coinvolto.", 
                              notifiable: @comment)
        end
      end

      redirect_to :controller => 'posts', :action => 'show', 
                  :id => comments_params[:post_id], #id del post
                  :message_board_id => Post.find(comments_params[:post_id]).message_board

    else 
      flash[:danger] = "Commento non inserito!"

      redirect_to :controller => 'posts', :action => 'show', 
                  :id => comments_params[:post_id], #id del post
                  :message_board_id => Post.find(comments_params[:post_id]).message_board,
                  :errors => @comment.errors.full_messages
    end
  end

  def destroy
    @post_id = @comment.post_id
    @message_board_id = Post.find(@post_id).message_board
    @comment.destroy ? flash[:success] = "Commento eliminato!" : flash[:danger] = "Commento non eliminato!"

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
