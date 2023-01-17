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
class MisosoupBase < ApplicationRecord
end
