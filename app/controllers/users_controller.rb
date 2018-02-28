class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def getAll
    @users = User.all.clean.index_by(&:id)
    json_response(@users)
  end

  def getOne
    @user = User.clean.where(id: params[:id]).first
    json_response(@user)
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
