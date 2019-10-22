class ReviewsController < ApplicationController

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		respond_to do |format|
			if @review.save
				format.html { redirect_to product_path(@review.product_id), notice: "Review successfully created" }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render :new }
				format.json { render json: @product.error, status: :unproccessable_entity }
			end	
		end	 
	end

	private

		def review_params
			params.require(:review).permit(:product_id, :user_id, :review_body, :number_of_stars)
		end	
end
