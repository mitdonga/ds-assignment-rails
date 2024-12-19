class MembersController < ApplicationController
  include BaseApiController

  def index
    @users = collection
    render "users/index", status: :ok
  end

  private

  def collection
    @user.members
  end
end
