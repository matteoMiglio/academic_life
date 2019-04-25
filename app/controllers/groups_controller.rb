class GroupsController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    @groups = current_user.groups.with_members(params[:message_board_id])
    @groups.each do |group|
      group.members.each { |member| member.membership if current_user.id == member.user_id }
    end
    @new_group = Group.new
  end

  def show
    @message_board = MessageBoard.find(params[:message_board_id])
    @group = Group.includes(:members).find(params[:id])
  end

  def create
    @message_board = MessageBoard.find(params[:message_board_id])
    @new_group = @message_board.groups.build(group_params)
    @creator = @new_group.members.build(membership: "creator", user_id: current_user.id)
    @new_group.create_group(@creator) ? flash[:success] = "Gruppo creato!"
                                      : flash[:danger]  = "Gruppo non creato!"
    redirect_to :controller => 'groups',
                :action     => 'index'
  end

  def destroy
    Group.find(params[:id]).destroy ? flash[:success] = "Gruppo eliminato!"
                                    : flash[:danger]  = "Gruppo non eliminato!"
    redirect_to :controller => 'groups', 
                :action => 'index' 
  end

  private

  def group_params
    params.require(:group).permit(:name, :state)
  end
end
