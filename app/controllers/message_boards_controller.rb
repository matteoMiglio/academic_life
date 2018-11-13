class MessageBoardsController < ApplicationController
  def show
    @message_board = MessageBoard.find(params[:id])
    @course = @message_board.course
  end
end
