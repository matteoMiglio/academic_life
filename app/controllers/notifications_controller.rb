class NotificationsController < ApplicationController
  load_and_authorize_resource :notification
  before_action :load_notifications, only: :index

  def index
  end

  def show
    @notification.read_at = Time.zone.now

    if @notification.save

      if @notification.notifiable.class == Comment

        redirect_to message_board_post_url(@notification.notifiable.post.message_board, 
                                           @notification.notifiable.post)

      elsif @notification.notifiable.class == Group

        redirect_to message_board_group_url(@notification.notifiable.message_board,
                                            @notification.notifiable)

      elsif @notification.notifiable.class == Event

        redirect_to message_board_group_url(@notification.notifiable.group.message_board,
                                            @notification.notifiable.group)

      elsif

        flash[:danger] = "Nessun link."

      end

    else

      flash[:danger] = "Errore durante lettura della notifica!"
    end
  end

  def destroy
    @notification.destroy ? flash[:success] = "Notifica eliminata!" 
                           : flash[:danger] = "Notifica non eliminata!"

    redirect_to notifications_url()
  end

  def load_notifications
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
end
