# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  avatar            :string
#  birthplace_code   :integer
#  crypted_password  :string
#  email             :string           not null
#  living_place_code :integer
#  role              :integer          default("general"), not null
#  salt              :string
#  username          :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
