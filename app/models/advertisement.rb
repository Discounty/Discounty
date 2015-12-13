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

class Advertisement < ActiveRecord::Base
  belongs_to :ad_campaign
end
