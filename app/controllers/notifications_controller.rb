class NotificationsController < ApplicationController

  def index

    @length_notifications = Notification.where(recipient_id: current_user).count

    @notifications = Notification.where(recipient_id: current_user)
                                 .pagination(params[:page], @length_notifications)

    # @posts.each do |post|
    #   post.user.name
    #   post.user.surname
    # end
  end
end
