class AddColumnIndexToPostIngredients < ActiveRecord::Migration[7.0]
  def change
    add_index :post_ingredients, %i(post_id ingredient_id), unique: true
  end
end
