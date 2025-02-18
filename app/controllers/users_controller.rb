class UsersController < ApplicationController
	before_action :authenticate_user, except: %i[create]

	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user, status: :ok
		else
			render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def index
		@users = User.all
		render json: @users, status: :ok
	end

	private

	def user_params
		params.permit(:username, :email, :password)
	end
end
