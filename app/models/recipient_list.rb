class RecipientList < ActiveRecord::Base
  belongs_to :ad_campaign
  has_many :customers
end
