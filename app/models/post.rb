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
  has_many :post_ingredients, dependent: :destroy
  has_many :ingredients, through: :post_ingredients
  has_many :post_misosoup_bases, dependent: :destroy
  has_many :misosoup_bases, through: :post_misosoup_bases

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  validates :content, length: { maximum: 65535 }

  scope :title_contain, ->(word) { where('posts.title LIKE ?', "#{word}") }
  scope :content_contain, ->(word) { where('posts.content LIKE ?', "#{word}") }
  scope :created_on, -> (date) { where(created_at: date.all_day) }

  def save_with(ingredient_ids, misosoup_base_ids)
    ActiveRecord::Base.transaction do
      self.ingredients = ingredient_ids.map { |id| Ingredient.find(id) }
      save!
      self.misosoup_bases ||= misosoup_base_ids.map { |id| MisosoupBase.find(id) }
      save!
    end
    true

    rescue StandardError
    false
  end

  def start_time
    self.created_at
  end
end
