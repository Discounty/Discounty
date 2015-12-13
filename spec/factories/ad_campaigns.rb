# == Schema Information
#
# Table name: ad_campaigns
#
#  id          :integer          not null, primary key
#  description :text
#  shop_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :ad_campaign do
    description "MyText"
shop nil
  end

end
