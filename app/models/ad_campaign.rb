class AdCampaign < ActiveRecord::Base
  belongs_to :shop
  has_many :advertisements
end
