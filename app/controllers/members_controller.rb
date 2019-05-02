class MembersController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @users         = @message_board.course.users.map { |user| [helpers.full_name(user), user.id] }
    @group         = Group.find(params[:group_id])
    @creator       = @group.members.find_creator
    @members       = @group.members.pagination(params[:page], @group.members.size)
    @members.each do |member|
      member.user.name
      member.user.surname
    end
    @new_member = Member.new
  end

  def create
    @group = Group.find(params[:group_id])
    @new_member = @group.members.build(user_id: member_params[:user_id], membership: "invited")
    @new_member.save ? flash[:success] = "Membro aggiunto!"
                     : flash[:danger]  = "Membro non aggiunto!"
    redirect_to :controller => 'members',
                :action => 'index'
  end

  def update
    @member = Member.find(params[:id])
    @member.update(membership: "member") ? flash[:success] = "Fai parte del gruppo!"
                                         : flash[:danger]  = "Non sei entrato nel gruppo!"
    redirect_to :controller => 'groups',
                :action => 'show',
                :id => params[:group_id]
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy ? flash[:success] = "Membro eliminato!"
                    : flash[:danger]  = "Membro non eliminato!"
    if @member.user_id == current_user.id
      redirect_to :controller => 'groups', 
                  :action => 'index' 
    else
      redirect_to :controller => 'members', 
                  :action => 'index' 
    end
  end

  private

  def member_params
    params.require(:member).permit(:user_id)
  end
end
