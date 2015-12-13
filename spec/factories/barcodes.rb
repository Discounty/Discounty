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

FactoryGirl.define do
  factory :barcode do
    barcode "MyString"
discount_percentage 1.5
extra_info "MyString"
barcode_type nil
discount_card nil
  end

end
