module BaseApiController
  extend ActiveSupport::Concern

  included do
    before_action :verify_jwt_expiration
    before_action :authenticate_user!
    before_action :set_user
    respond_to :json
  end

  private

  def set_user
    @user = current_user
  end

  def verify_jwt_expiration
    token = request.headers["Authorization"]&.split(" ")&.last
    return render json: { error: "Please login" }, status: :unauthorized if token.nil?

    begin
      decoded_token = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key, true, { algorithm: "HS256" })
      exp = decoded_token[0]["exp"]
      if Time.at(exp) < Time.now
        render json: { error: "Token has expired" }, status: :unauthorized
      end
    rescue JWT::ExpiredSignature
      render json: { error: "Token has expired" }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { error: "Invalid token" }, status: :unauthorized
    end
  end
end
