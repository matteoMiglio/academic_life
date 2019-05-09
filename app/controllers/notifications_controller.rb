class NotificationsController < ApplicationController

  def index
    @length_notifications = Notification.where(recipient_id: current_user).count

    @notifications = Notification.where(recipient_id: current_user)
                                 .pagination(params[:page], @length_notifications)

    @notifications.each do |notification|
      notification.actor.name
      notification.actor.surname
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

      elsif

        flash[:danger] = "Promemoria altre classi di notifiche"

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
