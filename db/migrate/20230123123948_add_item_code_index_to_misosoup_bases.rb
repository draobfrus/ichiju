class AddItemCodeIndexToMisosoupBases < ActiveRecord::Migration[7.0]
  def change
    add_index :misosoup_bases, :item_code, unique: true
  end
end
