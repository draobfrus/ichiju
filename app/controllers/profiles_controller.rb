class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_url, success: t('defaults.message.success', word: t('defaults.update'))
    else
      flash.now[:danger] = t('defaults.message.danger', word: t('defaults.update'))
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:username, :email, :birthplace_code, :living_place_code, :avatar, :avatar_cache)
  end
end
