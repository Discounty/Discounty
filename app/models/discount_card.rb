class DiscountCard < ActiveRecord::Base
  belongs_to :shop
  belongs_to :customer
end
