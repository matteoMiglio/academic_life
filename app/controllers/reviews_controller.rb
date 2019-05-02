class ReviewsController < ApplicationController
  def index
    @message_board = MessageBoard.find(params[:message_board_id])
    @course = @message_board.course
    @total_reviews = @message_board.reviews.count
    @find_my_review = @message_board.reviews.find_by(user_id: current_user.id)
    @reviews = @message_board.reviews.paginated(params[:page], @total_reviews)
    @reviews.each do |review|
      review.user.name
      review.user.surname
    end 
    @new_review = Review.new
  end

  def create
    @review = current_user.reviews.build(reviews_params)
    @review.save ? flash[:success] = "Opinione inserita!" 
                 : flash[:danger] = "Opinione non inserita!"
    redirect_to :controller => 'reviews', 
                :action => 'index', 
                :message_board_id => reviews_params[:message_board_id]
  end

  private
  
    def reviews_params
      params.require(:review).permit(:feedback, :message_board_id)
    end
end
