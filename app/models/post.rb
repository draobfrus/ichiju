class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  validates :content, length: { maximum: 65535 }
end
