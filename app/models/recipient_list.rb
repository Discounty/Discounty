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

class RecipientList < ActiveRecord::Base
  belongs_to :ad_campaign
  has_many :customers
end
