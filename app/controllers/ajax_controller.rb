class AjaxController < ApplicationController

	layout "ajax"

	def save_review
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.save
	end

	private

	def review_params
		params.require(:review).permit(:product_id, :review_body, :number_of_stars)
	end

end