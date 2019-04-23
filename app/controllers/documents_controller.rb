class DocumentsController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
  end

  def create
    @document = current_user.documents.build(documents_params)
    @document.save ? flash[:success] = "Documento inserito!" : flash[:danger] = "Documento non inserito!"

    redirect_to :controller => 'documents',
                :action => 'index',
                :message_board_id => params[:message_board_id]
  end

  def new
    @document = Document.new
  end

  def destroy
    @document.destroy ? flash[:success] = "Documento eliminato!" : flash[:danger] = "Documento non eliminato!"

    redirect_to :controller => 'documents',
                :action => 'index',
                :message_board_id => params[:message_board_id]
  end

  private
    def documents_params
      params.require(:document).permit(:name, :description, :category_id, :message_board_id)
    end

    def correct_user
      @document = current_user.documents.find_by(id: params[:id])

      if @document.nil?
        flash[:danger] = "Non puoi eliminare un documento caricato da un altro!"
        redirect_to request.referrer 
      end
    end
end
