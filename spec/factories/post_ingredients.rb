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
#  index_post_ingredients_on_ingredient_id              (ingredient_id)
#  index_post_ingredients_on_post_id                    (post_id)
#  index_post_ingredients_on_post_id_and_ingredient_id  (post_id,ingredient_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (ingredient_id => ingredients.id)
#  fk_rails_...  (post_id => posts.id)
#
FactoryBot.define do
  factory :post_ingredient do
    post { nil }
    ingredient { nil }
  end
end
