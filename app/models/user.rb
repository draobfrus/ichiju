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

  def familiar_miso
    self.regions.map do |region|
      case region
      when '北海道'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 北海道', genreId: '201213', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      when '東北'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 津軽 秋田 仙台 会津', genreId: '201213', orFlag: '1',  maxPrice: '1000').first(30)
      when '関東'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 江戸前', genreId: '201213', NGKeyword: 'ふるさと納税', orFlag: '1',  maxPrice: '1000').first(30)
      when '中部'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 加賀 越後 佐渡 信州 東海麦', genreId: '201213', NGKeyword: 'ふるさと納税', orFlag: '1',  maxPrice: '1000').first(30)
      when '関西'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 関西白', genreId: '201213', NGKeyword: 'ふるさと納税', orFlag: '1',  maxPrice: '1000').first(30)
      when '中国'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 瀬戸内麦', genreId: '201213', NGKeyword: 'ふるさと納税', orFlag: '1',  maxPrice: '1000').first(30)
      when '四国'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 讃岐味 御前', genreId: '201213', NGKeyword: 'ふるさと納税', orFlag: '1',  maxPrice: '1000').first(30)
      when '九州'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 九州麦', genreId: '201213', NGKeyword: 'ふるさと納税', orFlag: '1',  maxPrice: '1000').first(30)
      end
    end
  end

  def familiar_dashi
    self.regions.map do |region|
      case region
      when '北海道'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 かつお こんぶ', genreId: '410994', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      when '東北'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 にぼし さば', genreId: '410994', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      when '関東'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 かつお さば', genreId: '410994', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      when '中部'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 さば むろあじ', genreId: '410994', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      when '関西'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 こんぶ かつお さば にぼし', genreId: '410994', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      when '中国'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 にぼし やきあご かつお', genreId: '410994', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      when '四国'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 にぼし やきあご かつお', genreId: '410994', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      when '九州'
        RakutenWebService::Ichiba::Item.search(keyword: region + '産 にぼし やきあご かつお', genreId: '410994', NGKeyword: 'ふるさと納税', orFlag: '1', maxPrice: '1000').first(30)
      end
    end
  end

  def regions
    regions = []
    regions << self.birthplace.area if self.birthplace
    regions << self.living_place.area if self.living_place
    regions
  end
end
