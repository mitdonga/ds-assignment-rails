class UsersController < ApplicationController
  include BaseApiController

  def show
    render "users/show", status: :ok
  end
end
