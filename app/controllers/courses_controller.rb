class CoursesController < ApplicationController
  def index
    @user = current_user

    @courses = User.find(@user.id).courses.order(:credit)
  end

  def show
    redirect_to :controller => 'message_boards', :action => 'show', :id => params[:id]
  end
end
