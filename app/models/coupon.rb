class Coupon < ActiveRecord::Base
  has_one :barcode
  belongs_to :shop
  belongs_to :customer
end
