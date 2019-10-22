class CustomersController < ApplicationController

		before_action :set_customer, only: [:show, :edit, :update, :destroy] 

		before_action :check_if_the_user_is_admin

	def index
		@customers = Customer.paginate(page: params[:page], per_page: 2 )
	end

	def new
		@customer = Customer.new
	end

	def show
	end

	def edit
		
	end

	def create
		@customer = Customer.new(customer_params)
		respond_to do |format|
			if @customer.save
				format.html { redirect_to customer_path(@customer), notice: "successfully created" }
				format.json { render :show, status: :created, location: @customer }
			else
				format.html { render :new }
				format.json { render json: @customer.error, status: :unproccessable_entity }
			end
		end
	end
	
	def update
		respond_to do |format|
			if @customer.update(customer_params)
				format.html { redirect_to customer_path(@customer), notice: "successfully updated" }
				format.json { render :show, status: :updated, location: @customer }
			else	
				format.html { render :new }
				format.json { render json: @customer.error, status: :unproccessable_entity }
			end
		end					
	end	

	def destroy
		@customer.destroy
		respond_to do |format|
			format.html { redirect_to customers_path(@customer), notice: "successfully deleted" }
			format.json { head :no_content }
		end	
	end	

	private 
		def set_customer
			@customer ||= Customer.find(params[:id]) if params[:id]			
		end		

		def customer_params
			params.require(:customer).permit(:customer_name, :product_id, :city)
		end

		def check_if_the_user_is_admin
			unless current_user.has_role?("admin")
				flash[:notice] = "you are not admin, can't access this page"
				redirect_to "/"
			end	
		end
end






