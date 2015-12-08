# == Schema Information
#
# Table name: discount_cards
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  shop_id     :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe DiscountCard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
