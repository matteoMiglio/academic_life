module ReviewsHelper
  def new_form(reviews)
    if not @find_my_review
      render "new" 
    else
      if params[:page] == "1" or params[:page].nil?
        content_tag(:div, class: "card review-card") do
          content_tag(:div, "Hai già inserito la tua opinione. Bravo!", class: "card-body")
        end
      end
    end
  end
end
