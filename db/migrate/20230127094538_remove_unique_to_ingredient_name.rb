class RemoveUniqueToIngredientName < ActiveRecord::Migration[7.0]
  def up
    remove_index :ingredients, :name
    add_index :ingredients, :name
  end

  def down
    remove_index :ingredients, :name
    add_index :ingredients, :name, unique: true
  end
end
