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

require 'rails_helper'

RSpec.describe RecipientList, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
