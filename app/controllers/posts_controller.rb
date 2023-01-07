class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_url, success: t('defaults.message.success', word: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.danger', word: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), success: t('defaults.message.success', word: t('defaults.update'))
    else
      flash.now[:danger] = t('defaults.message.danger', word: t('defaults.update'))
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_url, success: t('defaults.message.success', word: t('defaults.delete')), status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
