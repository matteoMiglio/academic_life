class UsersController < ApplicationController
  load_and_authorize_resource :user

  def show
  end
end
