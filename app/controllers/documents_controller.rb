class DocumentsController < ApplicationController
  before_action :correct_user, only: :destroy
  
  def index
    @course = @message_board.course
    @documents = @message_board.documents.pagination(params[:page], @message_board.documents.size)

    @documents.each do |document|
      document.file
    end
  end

  def new
    @course = @message_board.course
    @categories = Category.all
    @document = Document.new

    @errors = params[:errors]
  end

  def create
    @document = current_user.documents.build(documents_params)

    if @document.save
      flash[:success] = "Documento inserito!"

      redirect_to :controller => 'documents',
                  :action => 'index',
                  :message_board_id => params[:message_board_id]
    else
      flash[:danger] = "Documento non inserito!"

      redirect_to :controller => 'documents',
                  :action => 'new',
                  :message_board_id => params[:message_board_id],
                  :errors => @document.errors.full_messages
    end

  end

  def destroy
    @document.file.purge
    @document.destroy ? flash[:success] = "Documento eliminato!" : flash[:danger] = "Documento non eliminato!"

    redirect_to :controller => 'documents',
                :action => 'index',
                :message_board_id => params[:message_board_id]
  end

  private
    def documents_params
      params.require(:document).permit(:name, :description, :category_id, :message_board_id, :file)
    end

    def correct_user
      @document = current_user.documents.find_by(id: params[:id])

      if @document.nil?
        flash[:danger] = "Non puoi eliminare un documento caricato da un altro!"
        redirect_to request.referrer 
      end
    end
end
