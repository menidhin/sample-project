class SellersController < ApplicationController

	before_action :set_seller, only: [:show, :edit, :update, :destroy]

	before_action :check_if_the_user_is_admin

	def index
		@sellers = Seller.paginate( page: params[:page], per_page: 2)
	end	

	def new
		@seller = Seller.new
	end	

	def show
	end

	def edit
	end	

	def create
		@seller = Seller.new(seller_params)
		respond_to do |format|
			if @seller.save
				format.html { redirect_to seller_path(@seller), notice:"successfully created" }
				format.json { render :show, status: :created, location: @seller }
			else
				format.html { render :new }
				format.json { render json: @seller.error, status: :unproccessable_entity }
			end	
		end	
	end

	def update
		respond_to do |format|
			if @seller.update(seller_params)
				format.html { redirect_to seller_path(@seller), notice: "successfully updated" }
				format.json { render :show, status: :updated, location: @seller }
			else
				format.html { render :new }
				format.json { render json: @seller.error, status: :unproccessable_entity}
			end	
		end
	end	

	def destroy
		@seller.destroy
		respond_to do |format|
			format.html { redirect_to sellers_path(@seller), notice: "successfully deleted"}
			format.json { head :no_content }
		end
	end			

	private

		def set_seller
				@seller ||= Seller.find(params[:id]) if params[:id]
		end

		def seller_params
			params.require(:seller).permit( :seller_name, :country)
		end	

		def check_if_the_user_is_admin
			unless current_user.has_role?("admin") 
				flash[:notice] = "You don't have access this page"
				redirect_to "/"
			end
		end

end	