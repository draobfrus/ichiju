class AddColumnIndexToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_index :bookmarks, %i(post_id user_id), unique: true
  end
end
