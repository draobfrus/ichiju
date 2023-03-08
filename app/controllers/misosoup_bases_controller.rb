class MisosoupBasesController < ApplicationController
  def index
    @misosoup_bases = current_user.misosoup_bases
  end

  def new
    # params[:keyword]に合致したデータをresultsに格納する
    return if params[:keyword].blank?

    @results = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword], genreId: '100300', NGKeyword: 'ふるさと納税').first(30)
    @results = Kaminari.paginate_array(@results.to_a).page(params[:page]).per(5)
  end

  def create
    @misosoup_base = MisosoupBase.new(item_code: params[:code],
                                      item_name: params[:name],
                                      item_url: params[:url],
                                      item_price: params[:price],
                                      item_image_urls: params[:image])
    if current_user.registered?(@misosoup_base)
      flash.now[:danger] = 'すでに登録しています'
      render :new, status: :unprocessable_entity
    else
      @misosoup_base.save!
      current_user.register(@misosoup_base)
      redirect_to misosoup_bases_url, success: t('defaults.message.registered', word: t('defaults.misosoup_base'))
    end
  end

  def destroy
    @misosoup_base = current_user.misosoup_bases.find(params[:id])
    @misosoup_base.destroy!
    redirect_to misosoup_bases_url, success: t('defaults.message.success', word: t('defaults.delete')), status: :see_other
  end

  def recommend
    @familiar_miso = [current_user.birthplace_miso, current_user.living_place_miso].compact.inject(:+).shuffle.first(3) if current_user.birthplace || current_user.living_place
    @familiar_dashi = [current_user.birthplace_dashi, current_user.living_place_dashi].compact.inject(:+).shuffle.first(3) if current_user.birthplace || current_user.living_place
  end
end
