class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.all.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save_with(ingredient_ids, misosoup_base_ids)
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
    @post.assign_attributes(post_params)
    if @post.save_with(ingredient_ids, misosoup_base_ids)
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

  def the_day
    @posts = Post.created_on(params[:date].to_date).order(created_at: :desc)
  end

  def search
    @search_form = SearchPostsForm.new(search_post_params)
    @posts = @search_form.search.includes(:user).order(created_at: :desc).page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache, ingredient_ids: [], misosoup_base_ids: [])
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def search_post_params
    params.fetch(:q, {}).permit(:title_or_content)
  end

  def ingredient_ids
    params[:post][:ingredient_ids].compact_blank
  end

  def misosoup_base_ids
    if current_user.misosoup_bases.present?
      params[:post][:misosoup_base_ids].compact_blank
    end
  end
end
