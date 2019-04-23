class GroupsController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    @groups = current_user.groups.with_members(params[:message_board_id])
    @groups.each do |group|
      group.members.each do |member|
        if current_user.id == member.user_id
          member.membership
        end
      end
    end
  end

  def show
    @group = Group.includes(:members).find(params[:id])
  end
end
