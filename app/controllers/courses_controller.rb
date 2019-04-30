class CoursesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @courses = @user.courses.order(:credit).to_a
    @courses.each do |course|
      course.message_board.id
    end
  end

  def show
    @message_board = MessageBoard.find_by(course_id: params[:id])
    redirect_to message_board_posts_url(@message_board)
  end
end
