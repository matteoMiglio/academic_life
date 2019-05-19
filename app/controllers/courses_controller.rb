class CoursesController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :course, through: :user

  def index
    @courses = @courses.includes(:message_board).order(:credit)
    @courses.each do |course|
      course.message_board.id
    end
  end

  def show
    @message_board = MessageBoard.find_by(course_id: params[:id])
    redirect_to message_board_posts_url(@message_board)
  end
end
