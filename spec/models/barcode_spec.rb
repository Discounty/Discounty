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

require 'rails_helper'

RSpec.describe Barcode, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
