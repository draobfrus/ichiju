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
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_misosoup_bases_on_item_code  (item_code) UNIQUE
#
FactoryBot.define do
  factory :misosoup_base do
    type { 1 }
    item_name { "MyString" }
    item_price { 1 }
    item_url { "MyString" }
    item_image_urls { "MyString" }
  end
end
