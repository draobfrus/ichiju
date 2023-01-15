# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  image      :string           not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :post_ingredients
  has_many :ingredients, through: :post_ingredients

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  validates :content, length: { maximum: 65535 }

  def save_with(ingredient_ids)
    ActiveRecord::Base.transaction do
      self.ingredients = ingredient_ids.map { |id| Ingredient.find(id) }
      save!
    end
    true

    rescue StandardError
    false
  end
end
