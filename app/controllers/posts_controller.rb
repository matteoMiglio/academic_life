class PostsController < ApplicationController
  load_and_authorize_resource :message_board
  before_action :load_posts, only: :index
  before_action :load_post, only: :show
  load_and_authorize_resource :post, through: :message_board

  def index
    @course = @message_board.course
    @posts.each do |post|
      post.user.name
      post.user.surname
    end
    @new_post = Post.new
  end

  def show
    @post.user.name
    @post.user.surname
    @comments = @post.comments.paginated(params[:page], @post.comments.size)
    @comments.each do |comment|
      comment.user.name
      comment.user.surname
    end
    @new_comment = Comment.new
  end

  def create
    @new_post = @message_board.posts.build(description: post_params[:description], 
                                           user_id: current_user.id)
    @new_post.save ? flash[:success] = "Post inserito!"
                   : flash[:danger] = "Post non inserito!"
    redirect_to :controller => 'posts',
                :action => 'index'
  end

  def destroy
    @post.destroy ? flash[:success] = "Post eliminato!"
                  : flash[:danger] = "Post non eliminato!"
    redirect_to :controller => 'posts',
                :action => 'index'
  end

  private

    def post_params
      params.require(:post).permit(:description)
    end

    def load_posts
      @posts = @message_board.posts.paginated(params[:page], @message_board.posts.size)
    end

    def load_post
      @post = @message_board.posts.includes(:approvals).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "Il post che vuoi visualizzare non esiste in questa bacheca"
      redirect_to :action => 'index'
    end
end
