# == Schema Information
#
# Table name: misosoup_bases
#
#  id              :bigint           not null, primary key
#  item_code       :string
#  item_image_urls :string
#  item_name       :string
#  item_price      :integer
#  item_url        :string
#  type            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_misosoup_bases_on_item_code  (item_code) UNIQUE
#
class MisosoupBase < ApplicationRecord
  has_many :user_misosoup_bases, dependent: :destroy
  has_many :users, through: :user_misosoup_bases
end