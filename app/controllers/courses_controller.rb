class CoursesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @courses = @user.courses.order(:credit)
  end

  def show
    redirect_to message_board_posts_url(params[:id])
  end
end
