class ProductImagesController < ApplicationController

	before_action :set_product_image, only: [:show, :edit, :update, :destroy]

	

	def new
		@product_image = ProductImage.new
	end

	def edit
	end

	def create
		@product_image = ProductImage.new(product_image_params)
		respond_to do |format|
			if @product_image.save
				format.html { redirect_to product_path(@product_image.product_id), notice: "successfully created" }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render :new }
				format.json { render json: @product.error, status: :unproccessable_entity }
			end	
		end	 
	end

	def update
		respond_to do |format| 
			if @product_image.update(product_image_params)
				format.html { redirect_to product_path(@product_image.product_id), notice: "successfully updated" } 
				format.json { render :show, status: :created, location: @product_image } 
			else
				format.html { render :edit }
				format.json { render json: @product_image.error, status: :unproccessable_entity}
			end
		end
	end

	def destroy
		product_id = @product_image.product_id
		@product_image.destroy
		respond_to do |format|
			format.html { redirect_to product_path(product_id), notice: "successfully deleted" }
			format.json { head :no_content}	
		end	
	end

	private

		def set_product_image
			@product_image ||= ProductImage.find(params[:id]) if params[:id]
		end
	
		def product_image_params
			params.require(:product_image).permit(:product_id, :image)
		end	
end
