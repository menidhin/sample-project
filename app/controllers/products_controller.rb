class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
		@products = Product.paginate(page: params[:page], per_page: 3)	
	end

	def show
		@review = Review.new
		@reviews = Review.includes(:user).where(:product_id => @product.id).paginate(:page => params[:page], :per_page => 5).order(:created_at => "ASC")
	end

	def new
		@product = Product.new
	end

	def edit
	end

	def create
		@product = Product.new(product_params)
		respond_to do |format|
			if @product.save
				format.html { redirect_to product_path(@product), notice: "successfully created" }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render :new }
				format.json { render json: @product.error, status: :unproccessable_entity }
			end	
		end	 
	end

	def update
		respond_to do |format| 
			if @product.update(product_params)
				format.html { redirect_to product_path(@product), notice: "successfully updated" } 
				format.json { render :show, status: :created, location: @product } 
			else
				format.html { render :edit }
				format.json { render json: @product.error, status: :unproccessable_entity}
			end
		end
	end

	def destroy
		@product.destroy
		respond_to do |format|
			format.html { redirect_to products_path, notice: "successfully deleted" }
			format.json { head :no_content}	
		end	
	end

	private

		def set_product
			@product ||= Product.find(params[:id]) if params[:id]
		end
	
		def product_params
			params.require(:product).permit( :name, :product_type, :price, :category_id, :seller_id)
		end	
end
