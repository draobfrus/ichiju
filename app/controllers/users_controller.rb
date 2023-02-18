class UsersController < ApplicationController
  skip_before_action :require_login
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to posts_url, success: t('defaults.message.success', word: t('defaults.register_and_login'))
    else
      flash.now[:danger] = t('defaults.message.danger', word: t('defaults.register'))
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :birthplace_code, :living_place_code, :password, :password_confirmation)
  end
end
