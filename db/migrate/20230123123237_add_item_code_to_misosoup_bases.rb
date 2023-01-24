class AddItemCodeToMisosoupBases < ActiveRecord::Migration[7.0]
  def change
    add_column :misosoup_bases, :item_code, :string
  end
end
