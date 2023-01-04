class UsersController < ApplicationController
  skip_before_action :require_login
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_url, success: t('messages.success', word: t('defaults.register'))
    else
      flash.now[:danger] = t('messages.danger', word: t('defaults.register'))
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :birthplace_code, :living_place_code, :password, :password_confirmation)
  end
end
