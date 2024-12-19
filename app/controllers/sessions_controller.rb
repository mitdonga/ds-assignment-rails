class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by(email: params[:email])

    if user && user.valid_password?(params[:password])
      sign_in(user)

      @user = user
      render "users/show", locals: { message: "Logged in successfully" }, status: :ok
    else
      render json: {
        message: "Invalid email or password"
      }, status: :unauthorized
    end
  end

  def destroy
    sign_out(current_user) if current_user

    head :ok
  end
end
