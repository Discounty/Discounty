# == Schema Information
#
# Table name: barcode_types
#
#  id           :integer          not null, primary key
#  barcode_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :barcode_type do
    type ""
  end

end
