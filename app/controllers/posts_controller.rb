class PostsController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    @posts = @message_board.posts.pagination(params[:page], @message_board.posts.size)
    @posts.each do |post|
      post.user.name
      post.user.surname
    end
    @new_post = Post.new
  end

  def show
    @post = Post.includes(:approvals).find(params[:id])
    @post.user.name
    @post.user.surname
    @comments = @post.comments.pagination(params[:page], @post.comments.size)
    @comments.each do |comment|
      comment.user.name
      comment.user.surname
    end
    @new_comment = Comment.new
  end

  def create
    @new_post = current_user.posts.build(post_params)
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
    params.require(:post).permit(:description, :message_board_id)
  end
end
