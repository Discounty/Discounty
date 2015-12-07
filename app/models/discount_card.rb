class DiscountCard < ActiveRecord::Base
  belongs_to :shop
  belongs_to :customer
  has_one :barcode
end
