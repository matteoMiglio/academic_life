class MembersController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @group = Group.find(params[:group_id])
    @members = @group.members
  end
end
