# == Schema Information
#
# Table name: barcode_types
#
#  id           :integer          not null, primary key
#  barcode_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe BarcodeType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
