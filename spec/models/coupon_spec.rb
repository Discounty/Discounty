# == Schema Information
#
# Table name: coupons
#
#  id          :integer          not null, primary key
#  description :text
#  barcode_id  :integer
#  shop_id     :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Coupon, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
