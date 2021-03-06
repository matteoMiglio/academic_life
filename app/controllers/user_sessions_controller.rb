class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)
    if @user_session.save
      flash[:success] = "Welcome back!"
      redirect_to user_courses_url(user_id: @user_session.user)
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end

  private

    def user_session_params
      params.require(:user_session).permit(:email, :password, :remember_me)
    end
end
