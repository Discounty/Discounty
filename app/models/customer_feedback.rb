# == Schema Information
#
# Table name: customer_feedbacks
#
#  id          :integer          not null, primary key
#  feedback    :text
#  rating      :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CustomerFeedback < ActiveRecord::Base
  belongs_to :customer
end
