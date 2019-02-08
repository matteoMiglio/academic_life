class PostsController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    @posts = @message_board.posts.to_index
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def create
    @post = Post.new(posts_params)
    @post.save ? flash[:success] = "Post inserito!"
               : flash[:danger] = "Post non inserito!"
    redirect_to :controller => 'message_boards',
                :action => 'show',
                :id => params[:message_board_id]
  end

  def destroy
    Post.find(params[:id]).destroy ? flash[:success] = "Post eliminato!"
                                   : flash[:danger] = "Post non eliminato!"
    redirect_to :controller => 'message_boards',
                :action => 'show',
                :id => params[:message_board_id]
  end

  private

  def posts_params
    params.require(:post).permit(:description, :user_id, :message_board_id)
  end

end
