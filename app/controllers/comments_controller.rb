class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post

    if @comment.save
      flash.now.notice = t('defaults.message.success', word: Comment.model_name.human)
    else
      redirect_to post_url(@post), danger: t('defaults.message.danger', word: Comment.model_name.human)
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    flash.now.notice = t('defaults.message.destroy', word: Comment.model_name.human)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
