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
  describe 'validations' do
    it { should validate_presence_of :shop }
    it { should validate_presence_of :description }
  end

  describe 'associations' do
    it { should belong_to :shop }
    it { should have_many :advertisements }
    it { should have_one :recipient_list }
  end
end
