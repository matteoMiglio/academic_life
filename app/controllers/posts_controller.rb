class PostsController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    @posts = @message_board.posts.with_users
    @new_post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    #@user = @post.user
    @comments = @post.comments
    @new_comment = Comment.new
    @post.user.name
    @post.user.surname
  end

  def create
    @new_post = Post.new description: post_params[:description],
                         message_board_id: params[:message_board_id],
                         user_id: current_user.id
    @new_post.save ? flash[:success] = "Post inserito!" 
               : flash[:danger] = "Post non inserito!"
    redirect_to :controller => 'posts', 
                :action => 'index'
  end

  def destroy
    Post.find(params[:id]).destroy ? flash[:success] = "Post eliminato!" 
                                   : flash[:danger] = "Post non eliminato!"
    redirect_to :controller => 'posts', 
                :action => 'index'
  end

  private

  def post_params
    params.require(:post).permit(:description)
  end
end
