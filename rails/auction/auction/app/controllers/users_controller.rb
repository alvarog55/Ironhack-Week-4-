class UsersController < ApplicationController
	def index
		@users = User.order_alph
	end

	def show
		id = params[:id]
		@user = User.find(id)

		if @user.nil?
			render :no_user_found
		else
			render :show
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to users_path
	end

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "User created succesfully"
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
