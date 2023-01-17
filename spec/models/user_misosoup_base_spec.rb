# == Schema Information
#
# Table name: user_misosoup_bases
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  misosoup_base_id :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_user_misosoup_bases_on_misosoup_base_id              (misosoup_base_id)
#  index_user_misosoup_bases_on_user_id                       (user_id)
#  index_user_misosoup_bases_on_user_id_and_misosoup_base_id  (user_id,misosoup_base_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (misosoup_base_id => misosoup_bases.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserMisosoupBase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
