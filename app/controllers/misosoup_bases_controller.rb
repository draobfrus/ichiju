class MisosoupBasesController < ApplicationController
  def new
    # params[:keyword]に合致したデータをresultsに格納する
    if params[:keyword].present?
      @results = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

end
