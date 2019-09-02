class UserDocumentsController < ApplicationController
  def index
    @documents = current_user.documents.pagination(params[:page], current_user.documents.size)
    @documents.each do |document|
      document.file
      document.message_board.course
    end
  end
end
