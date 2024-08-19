# frozen_string_literal: true

require "jwt"
module JsonWebToken extend ActiveSupport::Concern
  SECRET_KEY = Rails.configuration.secret_key_base
  ALGORITHM = "HS256"

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true, algorithm: ALGORITHM)[0]
    HashWithIndifferentAccess.new decoded
  end
end