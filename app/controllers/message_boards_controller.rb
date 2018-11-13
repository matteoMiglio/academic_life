class MessageBoardsController < ApplicationController
  def show
    @message_board = MessageBoard.find_by(course_id: params[:id])
    @course = @message_board.course
  end
end
