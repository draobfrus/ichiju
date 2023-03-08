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
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts, dependent: :destroy
  has_many :user_misosoup_bases, dependent: :destroy
  has_many :misosoup_bases, through: :user_misosoup_bases
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: { general: 0, admin: 1 }

  include JpPrefecture
  jp_prefecture :birthplace_code, method_name: :birthplace
  jp_prefecture :living_place_code, method_name: :living_place

  def own?(object)
    id == object.user_id
  end

  def bookmark(post)
    bookmark_posts << post
  end

  def unbookmark(post)
    bookmark_posts.destroy(post)
  end

  def bookmark?(post)
    bookmark_posts.include?(post)
  end

  def register(misosoup_base)
    misosoup_base.save!
    user_misosoup_bases.create!(misosoup_base_id: misosoup_base.id)
  end

  def registered?(misosoup_base)
    misosoup_bases.exists?(item_code: misosoup_base.item_code)
  end

  def birthplace_miso
    RakutenWebService::Ichiba::Item.search(keyword: birthplace.name + '産', genreId: '201213', NGKeyword: 'ふるさと納税').first(10) if birthplace
  end

  def birthplace_dashi
    RakutenWebService::Ichiba::Item.search(keyword: birthplace.name + '産', genreId: '410994', NGKeyword: 'ふるさと納税').first(10) if birthplace
  end

  def living_place_miso
    RakutenWebService::Ichiba::Item.search(keyword: living_place.name + '産', genreId: '201213', NGKeyword: 'ふるさと納税').first(10) if living_place
  end

  def living_place_dashi
    RakutenWebService::Ichiba::Item.search(keyword: living_place.name + '産', genreId: '410994', NGKeyword: 'ふるさと納税').first(10) if living_place
  end
end
