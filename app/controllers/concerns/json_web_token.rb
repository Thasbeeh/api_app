# frozen_literal_string: true

module JsonWebToken
	extend ActiveSupport::Concern

	def encode_token(api_body)
		api_body[:exp] = 1.day.from_now.to_i
		JWT.encode(api_body, Rails.application.secret_key_base)
	end

	def decode_token(token)
		decoded = JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' }).first
		HashWithIndifferentAccess.new decoded
	end
end
