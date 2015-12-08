# == Schema Information
#
# Table name: barcode_types
#
#  id           :integer          not null, primary key
#  barcode_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BarcodeType < ActiveRecord::Base
  belongs_to :barcode
end
