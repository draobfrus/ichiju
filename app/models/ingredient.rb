# == Schema Information
#
# Table name: ingredients
#
#  id             :bigint           not null, primary key
#  classification :integer          not null
#  name           :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Ingredient < ApplicationRecord
  has_many :post_ingredients
  has_many :posts, through: :post_ingredients

  validates :name, presence: true, length: { maximum: 255 }
  validates :classification, presence: true

  enum classification: { vegetable: 10, meat: 20, fish: 30, seasoning: 40, other: 50 }
end
