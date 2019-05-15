class EventsController < ApplicationController
  def show
  end

  def create
    @message_board = MessageBoard.find(params[:message_board_id])
    @group = Group.find(params[:group_id])
    @event = current_user.events.build(events_params)
    @event.save ? flash[:success] = "Evento creato!" 
                : flash[:danger] = "Errore creazione evento"
    
    @event.participants.create(role: "creator", user_id: current_user.id)
    @group.users.each do |user|
      if user.id != current_user.id
        @event.participants.create(role: "member", user_id: user.id)
      end
    end
    
    redirect_to message_board_group_url(@message_board, @group)
  end

  def new
    @message_board = MessageBoard.find(params[:message_board_id])
    @group = Group.find(params[:group_id])
    @event = Event.new
  end

  def destroy
    Event.find(params[:id]).destroy ? flash[:succes] = "Evento eliminato!"
                                    : flash[:danger] = "Errore eliminazione evento"
    
    @message_board = MessageBoard.find(params[:message_board_id])
    @group = Group.find(params[:group_id])
    redirect_to message_board_group_url(@message_board, @group)
  end

  private
    def events_params
      params.require(:event).permit(:name, :description, :appointment, :place, :group_id)
    end
end
