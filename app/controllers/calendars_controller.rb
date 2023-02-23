class CalendarsController < ApplicationController
  def show
    @misosoup_bases = current_user.misosoup_bases
    @posts = current_user.posts
  end

  def search
    @posts = current_user.posts.created_on(params[:date].to_date).order(created_at: :desc)
  end
end
