class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post

    if @comment.save
      redirect_to post_url(@post), success: t('defaults.message.success', word: Comment.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.danger', word: Comment.model_name.human)
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    redirect_to post_url(@comment.post), success: t('defaults.message.success', word: t('defaults.delete')), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
