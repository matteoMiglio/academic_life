class MembersController < ApplicationController
  load_and_authorize_resource :message_board
  load_and_authorize_resource :group, through: :message_board
  before_action :load_members, only: :index
  load_and_authorize_resource :member, through: :group
  
  def index
    @users = @message_board.course.users
                           .where.not(id: current_user.id).map { |user| [helpers.full_name(user), user.id] }
    @creator = @group.members.find_creator
    @members.each do |member|
      member.user.name
      member.user.surname
    end
    @new_member = Member.new
  end

  def create
    Member.transaction do
      Notification.transaction do

        begin
          @id_member_to_add = @message_board.course.users.find(member_params[:user_id]).id
          @new_member = @group.members.build(user_id: @id_member_to_add, membership: "invited")
          @new_member.save 
          flash[:success] = "Membro aggiunto!"

          # invio la notifica
          if current_user != @new_member.user
            Notification.create(recipient: @new_member.user, 
                                actor: current_user, 
                                action: "ti ha invitato in un gruppo privato.", 
                                notifiable: @group)
          end
        rescue ActiveRecord::RecordInvalid
          flash[:danger] = "Membro non aggiunto!"
        end
      end
    end
    redirect_to :controller => 'members',
                :action => 'index'
  end

  def update
    @member.update(membership: "member") ? flash[:success] = "Fai parte del gruppo!"
                                         : flash[:danger] = "Non sei entrato nel gruppo!"
    redirect_to :controller => 'groups',
                :action => 'show',
                :id => params[:group_id]
  end

  def destroy
    if @member.membership == "creator"
      
    redirect_to :controller => 'groups', 
                :action => 'destroy',
                :id => @member.group_id
    else
      @member.destroy ? flash[:success] = "Membro eliminato!"
                      : flash[:danger] = "Membro non eliminato!"
      if @member.user_id == current_user.id
        redirect_to :controller => 'groups', 
                    :action => 'index' 
      else
        redirect_to :controller => 'members', 
                    :action => 'index' 
      end
    end
  end

  private

    def member_params
      params.require(:member).permit(:user_id)
    end

    def load_members
      @members = @group.members.paginated(params[:page], @group.members.size)
    end
end
