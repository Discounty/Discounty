# == Schema Information
#
# Table name: barcodes
#
#  id                  :integer          not null, primary key
#  barcode             :string
#  discount_percentage :float
#  extra_info          :string
#  barcode_type_id     :integer
#  discount_card_id    :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Barcode < ActiveRecord::Base
  belongs_to :discount_card
  has_one :barcode_type
end
