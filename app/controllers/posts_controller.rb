class PostsController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    @posts = @message_board.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      flash[:success] = "Post inserito!"
    else
      flash[:danger] = "Post non inserito!"
    end
    redirect_to :controller => 'message_boards', :action => 'show', :id => params[:message_board_id]
  end

  def destroy
    if Post.find(params[:id]).destroy
      flash[:success] = "Post eliminato!"
    else
      flash[:danger] = "Post non eliminato!"
    end
    redirect_to :controller => 'message_boards', :action => 'show', :id => params[:message_board_id]
  end

  private

  def posts_params
    params.require(:post).permit(:description, :user_id, :message_board_id)
  end
end
