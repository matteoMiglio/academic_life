class CoursesController < ApplicationController
  def index
    # bisogna creare un apposito metodo
    # @user = current_user
    # @courses = User.find(current_user.id).courses.order(:credit)
    @courses = Course.all
  end

  def show
    redirect_to message_board_posts_url(params[:id])
  end
end
