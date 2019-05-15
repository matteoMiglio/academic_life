class NotificationsController < ApplicationController

  def index
    @length_notifications = Notification.where(recipient_id: current_user).count

    if @length_notifications > 0
      @notifications = Notification.where(recipient_id: current_user)
                                  .pagination(params[:page], @length_notifications)

      @notifications.each do |notification|
        notification.actor.name
        notification.actor.surname
      end
    else
      @notifications = nil
    end
  end

  def show
    @notification = Notification.find_by(id: params[:id])

    @notification.read_at = Time.zone.now
    if @notification.save

      if @notification.notifiable.class == Comment

        redirect_to :controller => 'posts',
                    :action => 'show',
                    :id => @notification.notifiable.post

      elsif @notification.notifiable.class == Group

        redirect_to :controller => 'groups',
                    :action => 'show',
                    :message_board_id => @notification.notifiable.message_board,
                    :id => @notification.notifiable

      elsif @notification.notifiable.class == Event

        redirect_to :controller => 'groups',
                    :action => 'show',
                    :message_board_id => @notification.notifiable.group.message_board,
                    :id => @notification.notifiable.group

      elsif

        flash[:danger] = "Nessun link."

      end

    else

      flash[:danger] = "Errore durante lettura della notifica!"

      redirect_to :controller => 'notifications',
                  :action => 'index'
    end
  end

  def destroy
    @notifications = Notification.find_by(id: params[:id])

    @notifications.destroy ? flash[:success] = "Notifica eliminata!" 
                           : flash[:danger] = "Notifica non eliminata!"

    redirect_to :controller => 'notifications', 
                :action => 'index'
  end
end
