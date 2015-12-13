# == Schema Information
#
# Table name: customer_feedbacks
#
#  id          :integer          not null, primary key
#  feedback    :text
#  rating      :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :customer_feedback do
    feedback "MyText"
rating 1
customer nil
  end

end
