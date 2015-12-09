# == Schema Information
#
# Table name: advertisements
#
#  id             :integer          not null, primary key
#  name           :string
#  ad_data        :json
#  ad_campaign_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :advertisement do
    name "MyString"
ad_data ""
ad_campaign nil
  end

end
