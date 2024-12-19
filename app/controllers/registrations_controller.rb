class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if params[:ref].present?
      referrer = User.find_by(referral_code: params[:ref])
      resource.referrer = referrer if referrer.present?
    end

    if resource.save
      sign_in(resource)

      render json: {
        message: "Signed up successfully"
      }, status: :ok
    else
      render json: {
        message: "Sign up failed",
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
