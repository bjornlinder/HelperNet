class UsersController < ApplicationController
  def edit
    @user = User.first
  end

  def update
    @user.update!(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :phone, :email)
  end
end
