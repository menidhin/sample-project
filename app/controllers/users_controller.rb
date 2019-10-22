class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	before_action :check_if_the_user_is_admin 

	def index
		@users = User.paginate( page: params[:page], per_page: 2)
	end	

	def new
		@user = User.new
	end	

	def show
	end

	def edit
	end	

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.html { redirect_to user_session_path(@user), notice:"successfully created" }
				format.json { render :show, status: :created, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.error, status: :unproccessable_entity }
			end	
		end	
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to user_session_path(@user), notice: "successfully updated" }
				format.json { render :show, status: :updated, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.error, status: :unproccessable_entity}
			end	
		end
	end	

	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_session_path(@user), notice: "successfully deleted"}
			format.json { head :no_content }
		end
	end			

	private

		def set_user
				@user_session ||= User.find(params[:id]) if params[:id]
		end

		def user_params
			params.require(:user).permit( :email, :password, :roles)
		end	

		def check_if_the_user_is_admin
			unless current_user.has_role?("admin")
			 flash[:notice] = "you can't access this page!!"
			 redirect_to "/"	
			end
		end

end	