# == Schema Information
#
# Table name: misosoup_bases
#
#  id              :bigint           not null, primary key
#  item_image_urls :string
#  item_name       :string
#  item_price      :integer
#  item_url        :string
#  type            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
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
