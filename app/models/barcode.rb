class Barcode < ActiveRecord::Base
  belongs_to :discount_card
  has_one :barcode_type
end
