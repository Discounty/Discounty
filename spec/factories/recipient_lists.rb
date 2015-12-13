# == Schema Information
#
# Table name: recipient_lists
#
#  id             :integer          not null, primary key
#  ad_campaign_id :integer
#  customer_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :recipient_list do
    ad_campaign nil
  end

end
