class EventsController < ApplicationController
  load_and_authorize_resource :message_board
  load_and_authorize_resource :group, through: :message_board

  def index

    # @id_events = Participant.where(user_id: current_user).select(:event_id)
    # @events = Event.where(:id => @id_events).paginated(params[:page], Event.where(:id => @id_events).size)

    @events = current_user.events.paginated(params[:page], current_user.events.size)

    @events.each do |event|
    end
    
  end

  def create
    Event.transaction do
      Notification.transaction do

        begin 

          @event = @group.events.build(events_params)
          @event.save! 
          
          @event.participants.create(role: "creator", user_id: current_user.id)
          @group.users.each do |user|
            if user.id != current_user.id
              @event.participants.create(role: "member", user_id: user.id)

              Notification.create(recipient: user, 
                actor: current_user, 
                action: "ha creato un evento in un gruppo di cui fai parte.", 
                notifiable: @event)
            end
          end
            
          flash[:success] = "Evento creato!" 
        
        rescue ActiveRecord::RecordInvalid
          flash[:danger] = "Errore creazione evento"
        end
      end
    end
    redirect_to message_board_group_url(@message_board, @group)
  end

  def new
    @event = Event.new
  end

  def destroy
    Event.find(params[:id]).destroy ? flash[:success] = "Evento eliminato!"
                                    : flash[:danger] = "Errore eliminazione evento"
    
    @message_board = MessageBoard.find(params[:message_board_id])
    @group = Group.find(params[:group_id])
    redirect_to message_board_group_url(@message_board, @group)
  end

  private
    def events_params
      params.require(:event).permit(:name, :description, :appointment, :place)
                            .merge(user_id: current_user.id)
    end
end
