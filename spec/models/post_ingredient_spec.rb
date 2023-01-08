# == Schema Information
#
# Table name: post_ingredients
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :bigint           not null
#  post_id       :bigint           not null
#
# Indexes
#
#  index_post_ingredients_on_ingredient_id  (ingredient_id)
#  index_post_ingredients_on_post_id        (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (ingredient_id => ingredients.id)
#  fk_rails_...  (post_id => posts.id)
#
require 'rails_helper'

RSpec.describe PostIngredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
