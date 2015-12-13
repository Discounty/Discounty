# == Schema Information
#
# Table name: coupons
#
#  id          :integer          not null, primary key
#  description :text
#  barcode_id  :integer
#  shop_id     :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :coupon do
    description "MyText"
barcode nil
shop nil
customer nil
  end

end
