# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  image      :string           not null
#  status     :integer          default("public"), not null
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
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarking_users, through: :bookmarks, source: :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  validates :content, length: { maximum: 65_535 }
  validates :status, presence: true

  enum :status, { public: 0, private: 1 }, prefix: true

  scope :with_ingredient, ->(ingredient_name) { joins(:ingredients).where(ingredients: { name: ingredient_name }) }
  scope :title_contain, ->(word) { where('title LIKE ?', "%#{word}%") }
  scope :content_contain, ->(word) { where('content LIKE ?', "%#{word}%") }
  scope :created_on, ->(date) { where(created_at: date.all_day) }
  scope :sort_by_created_at, -> { status_public.includes(:user).order(created_at: :desc) }
  scope :sort_by_likes_count, -> { status_public.includes(:liking_users).order(created_at: :desc).sort { |a, b| b.liking_users.size <=> a.liking_users.size } }

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

  def bookmarked_by?(user)
    bookmarking_users.include?(user)
  end

  def liked_by?(user)
    liking_users.include?(user)
  end

  def start_time
    created_at
  end
end
