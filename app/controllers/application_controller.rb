# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :authenticate_user_jwt

  private

  def authenticate_user_jwt
    return if current_user.nil?

    generate_user_jwt_token if current_user.jwt_key.nil?

    timestamp = get_user_jwt_timestamp

    if timestamp > Time.now - 5.minutes
      generate_user_jwt_token
    else
      update_user_jwt(nil)
      sign_out(current_user)
      redirect_to root_path
    end
  end

  def generate_user_jwt_token
    payload = { id: current_user.id, timestamp: Time.now }
    token = JWT.encode payload, ENV['JWT_KEY'], ENV['JWT_ALGORITHM']
    update_user_jwt(token)
  end

  def get_user_jwt_timestamp
    decoded_token = JWT.decode current_user.jwt_key, ENV['JWT_KEY'], true, { algorithm: ENV['JWT_ALGORITHM'] }
    decoded_token[0]['timestamp']
  end

  def update_user_jwt(jwt)
    User.find(current_user.id).update_column('jwt_key', jwt)
  end
end
