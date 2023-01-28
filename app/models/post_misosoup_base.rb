# == Schema Information
#
# Table name: post_misosoup_bases
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  misosoup_base_id :bigint           not null
#  post_id          :bigint           not null
#
# Indexes
#
#  index_post_misosoup_bases_on_misosoup_base_id              (misosoup_base_id)
#  index_post_misosoup_bases_on_post_id                       (post_id)
#  index_post_misosoup_bases_on_post_id_and_misosoup_base_id  (post_id,misosoup_base_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (misosoup_base_id => misosoup_bases.id)
#  fk_rails_...  (post_id => posts.id)
#
class PostMisosoupBase < ApplicationRecord
  belongs_to :post
  belongs_to :misosoup_base

  validates :post_id, uniqueness: { scope: :misosoup_base_id }
end
