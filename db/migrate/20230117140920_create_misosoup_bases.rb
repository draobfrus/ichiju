class CreateMisosoupBases < ActiveRecord::Migration[7.0]
  def change
    create_table :misosoup_bases do |t|
      t.integer :type
      t.string :item_name
      t.integer :item_price
      t.string :item_url
      t.string :item_image_urls

      t.timestamps
    end
  end
end
