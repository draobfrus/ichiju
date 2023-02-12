class CalendarsController < ApplicationController
  def show
    @misosoup_bases = current_user.misosoup_bases
    @posts = current_user.posts
  end
end
