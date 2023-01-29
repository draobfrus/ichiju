class CreatePostMisosoupBases < ActiveRecord::Migration[7.0]
  def change
    create_table :post_misosoup_bases do |t|
      t.references :post, null: false, foreign_key: true
      t.references :misosoup_base, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_misosoup_bases, %i(post_id misosoup_base_id), unique: true
  end
end
