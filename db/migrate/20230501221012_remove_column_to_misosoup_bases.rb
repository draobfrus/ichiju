class RemoveColumnToMisosoupBases < ActiveRecord::Migration[7.0]
  def up
    remove_column :misosoup_bases, :type
  end

  def down
    add_column :misosoup_bases, :type, :integer
  end
end
