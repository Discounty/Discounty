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

class AdCampaign < ActiveRecord::Base
  belongs_to :shop
  has_many :advertisements
  has_one :recipient_list
end
