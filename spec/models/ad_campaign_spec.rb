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

require 'rails_helper'

RSpec.describe AdCampaign, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
