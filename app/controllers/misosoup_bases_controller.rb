class MisosoupBasesController < ApplicationController
  def new
    # params[:keyword]に合致したデータをresultsに格納する
    if params[:keyword].present?
      @results = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def create
    @misosoup_base = MisosoupBase.new(item_code: params[:code],
                                      item_name: params[:name],
                                      item_url: params[:url],
                                      item_image_urls: params[:image])
    unless current_user.registered?(@misosoup_base)
      @misosoup_base.save!
      current_user.register(@misosoup_base)
      redirect_to mypage_url
    else
      flash.now[:danger] = 'すでに登録しています'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @misosoup_base = current_user.misosoup_bases.find(params[:id])
    @misosoup_base.destroy!
    redirect_to mypage_url, success: t('defaults.message.success', word: t('defaults.delete')), status: :see_other
  end
end
