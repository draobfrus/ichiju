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
FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    birthplace_code { 4 }
    living_place_code { 7 }
    role { :admin }
  end
end
