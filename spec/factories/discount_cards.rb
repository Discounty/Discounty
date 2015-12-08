# == Schema Information
#
# Table name: discount_cards
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  shop_id     :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :discount_card do
    name "MyString"
description "MyString"
shop nil
customer nil
  end

end
