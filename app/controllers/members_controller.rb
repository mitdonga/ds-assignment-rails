class MembersController < ApplicationController
  include BaseApiController

  def index
    @users = collection
    render "users/index", status: :ok
  end

  def invite
    unless params[:email]&.match?(Devise.email_regexp)
      return render json: { error: "Invalid email" }, status: :unprocessable_entity
    end

    user = User.find_by_email(params[:email])
    if user.present?
      render json: { error: "User already exists" }, status: :unprocessable_entity
    else
      UserMailer.invite(referrer: @user, email: params[:email]).deliver_later
      render json: { message: "Invitation sent" }, status: :ok
    end
  end

  private

  def collection
    @user.members
  end
end
