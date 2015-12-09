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

class DiscountCard < ActiveRecord::Base
  belongs_to :shop
  belongs_to :customer
  has_one :barcode
end
