class AuthenticationController < ApplicationController
	before_action	:authenticate_user, except: %i[login]

	def login
		@user = User.find_by(email: params[:email])
		if @user&.authenticate(params[:password])
			token = encode_token(user_id: @user.id)
			render json: { token: token }, status: :ok
		else
			render json: 'Unauthorized', status: :unauthorized
		end
	end
end
