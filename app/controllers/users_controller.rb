class UsersController < ApplicationController
  def edit
    @user = User.first
  end

  def update
    @user = User.find_by(phone: params[:user][:phone]) ||
            User.find_by(email: params[:user][:email])

    @user.update!(user_params)

    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :phone, :email)
  end
end
