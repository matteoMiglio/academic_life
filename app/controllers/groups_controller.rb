class GroupsController < ApplicationController
  load_and_authorize_resource :message_board
  before_action :load_groups, only: :index
  before_action :load_group, only: :show
  load_and_authorize_resource :group, through: :message_board

  def index
    @course = @message_board.course
    @groups.each do |group|
      group.members.each { |member| member.membership if current_user.id == member.user_id }
      group.message_board
    end
    @new_group = Group.new
    @errors = params[:errors] if not params[:errors].nil?
  end

  def show
    @course = @message_board.course
    @events = @group.events.find_next
    @events.each do |event|
    end

    @creators = Participant.where(role: "creator", user_id: current_user.id)
    @creators.each do |creator|
      creator.event_id
    end
  end

  def create
    @new_group = @message_board.groups.build(name: group_params[:name],
                                             state: "private")
    @creator = @new_group.members.build(membership: "creator", 
                                        user_id: current_user.id)
    @new_group.create_group(@creator) ? flash[:success] = "Gruppo creato!"
                                      : flash[:danger] = "Gruppo non creato!"
    redirect_to :controller => 'groups',
                :action => 'index',
                :errors => @new_group.errors.full_messages
  end

  def destroy
    @group.destroy ? flash[:success] = "Gruppo eliminato!"
                   : flash[:danger] = "Gruppo non eliminato!"
    redirect_to :controller => 'groups', 
                :action => 'index' 
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end

    def load_groups
      @groups = current_user.groups.paginated(@message_board.id, params[:page],
                                              @message_board.groups.size)
    end

    def load_group
      @group = @message_board.groups.includes(:members).find(params[:id])
    end
end
