class RatesController < ApplicationController

  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    @total_rates = @message_board.rates

    @media = 0.0
    if @total_rates.length > 0
    
      @total_rates.each { |r| @media += r.grade }
      @media /= @total_rates.length
    end

    @media = @media.round(2)

    @new_rate = nil
    if @total_rates.find_by(user_id: current_user).nil?
      @new_rate = Rate.new
    end

    @errors = params[:errors] if not params[:errors].nil?
  end

  def create
    @rate = current_user.rates.build(rates_params)

    if @rate.save
      flash[:success] = "Voto inserito!" 

      redirect_to :controller => 'rates', 
                  :action => 'index', 
                  :message_board_id => rates_params[:message_board_id]
    else 
      flash[:danger] = "Voto non inserito!"

      redirect_to :controller => 'rates', 
                  :action => 'index', 
                  :message_board_id => rates_params[:message_board_id],
                  :errors => @rate.errors.full_messages
    end
  end

  private
  
    def rates_params
      params.require(:rate).permit(:grade, :message_board_id)
    end

end
