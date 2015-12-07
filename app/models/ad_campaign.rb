class AdCampaign < ActiveRecord::Base
  belongs_to :shop
  has_many :advertisements
  has_one :recipient_list
end
