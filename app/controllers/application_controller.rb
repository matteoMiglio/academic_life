class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to errors_access_denied_url
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to errors_record_not_found_url
  end
  
  helper_method :current_user_session, :current_user
  before_action :get_unread_notifications #, if: :user_signed_in?

  def get_unread_notifications
    @unread_notifications = Notification.where(recipient_id: current_user, read_at: nil).count
  end

  private

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
end
