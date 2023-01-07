class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to posts_url, success: t('defaults.message.success', word: t('defaults.login'))
    else
      flash.now[:danger] = t('defaults.message.danger', word: t('defaults.login'))
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_url, success: t('defaults.message.success', word: t('defaults.logout'))
  end
end
