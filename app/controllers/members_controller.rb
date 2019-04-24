class MembersController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @group         = Group.includes(:members).find(params[:group_id])
    @creator       = @group.members.find_creator
    @members       = @group.members.pagination(params[:page])
    @members.each do |member|
      member.user.name
      member.user.surname
    end
  end
end
