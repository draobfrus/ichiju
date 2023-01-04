class UsersController < ApplicationController
  skip_before_action :require_login
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_url, success: "ユーザー登録に成功しました"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :birthplace_code, :living_place_code, :password, :password_confirmation)
  end
end
