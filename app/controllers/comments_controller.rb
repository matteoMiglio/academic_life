class CommentsController < ApplicationController
  load_and_authorize_resource :message_board
  load_and_authorize_resource :post, through: :message_board
  load_and_authorize_resource :comment, through: :post

  def create
    Comment.transaction do
      Notification.transaction do

        begin
          @comment = @post.comments.build(description: comment_params[:description],
                                          user_id: current_user.id)
          @comment.save
          flash[:success] = "Commento inserito!" 

          # Create the notification to the owner's post
          @post = @comment.post
          Notification.create(recipient: @post.user, 
                              actor: current_user, 
                              action: "ha commentato il tuo post.", 
                              notifiable: @comment)

          # Create the notifications
          @post.comments.select(:user_id).distinct.each do |comment|
            if comment.user != current_user
              Notification.create(recipient: comment.user, 
                                  actor: current_user, 
                                  action: "ha commentato un post nel quale sei coinvolto.", 
                                  notifiable: @comment)
            end
          end
          redirect_to :controller => 'posts', 
                      :action => 'show', 
                      :id => @post.id,
                      :message_board_id => @message_board.id

        rescue ActiveRecord::RecordInvalid
          flash[:danger] = "Commento non inserito!"
          redirect_to :controller => 'posts', 
                      :action => 'show', 
                      :id => @post.id,
                      :message_board_id => @post.message_board_id,
                      :errors => @comment.errors.full_messages
        end
      end
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
