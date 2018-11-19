class CoursesController < ApplicationController
  def index
    # bisogna creare un apposito metodo
    # @user = current_user
    # @courses = User.find(current_user.id).courses.order(:credit)
    @courses = Course.all
  end

  def show
    redirect_to :controller => 'message_boards', :action => 'show', :id => params[:id]
  end
end
