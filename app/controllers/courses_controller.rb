class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    redirect_to :controller => 'message_boards', :action => 'show', :id => params[:id]
  end
end
