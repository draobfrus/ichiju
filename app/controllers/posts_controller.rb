class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
  end

  def create
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end