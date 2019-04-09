class PostsController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    # versione senza paginazione
    # @posts = @message_board.posts.with_users
    # versione con paginazione
    @posts = @message_board.posts.pagination(params[:page])
    @posts.each do |post|
      post.user.name
      post.user.surname
      @pre_approval = post.approvals.find { |approval| approval.user_id == current_user.id }
    end
    @new_post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @pre_approval = @post.approvals.find { |approval| approval.user_id == current_user.id }
    @post.user.name
    @post.user.surname

    @comments = @post.comments.pagination(params[:page])
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
