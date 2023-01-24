class MypagesController < ApplicationController
  def show
    @misosoup_bases = current_user.misosoup_bases
  end
end
