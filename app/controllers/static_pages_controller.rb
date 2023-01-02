class StaticPagesController < ApplicationController
  skip_before_action :requre_login

  def top; end
end
