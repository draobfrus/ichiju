class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 255, null: false
      t.string :image, null: false
      t.text :content, limit: 65535
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
