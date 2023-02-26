class BookmarksController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_back fallback_location: posts_path, success: 'ブックマークしました'
  end

  def destroy
    post = current_user.bookmarks.find(params[:id]).post
    current_user.unbookmark(post)
    redirect_back fallback_location: posts_path, success: 'ブックマークを解除しました', status: :see_other
  end
end
