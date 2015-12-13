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

class Coupon < ActiveRecord::Base
  has_one :barcode
  belongs_to :shop
  belongs_to :customer
end
