# == Schema Information
#
# Table name: ingredients
#
#  id             :bigint           not null, primary key
#  classification :integer          not null
#  name           :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_ingredients_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
