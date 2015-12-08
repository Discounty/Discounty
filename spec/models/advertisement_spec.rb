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

require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
