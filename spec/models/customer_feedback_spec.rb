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

require 'rails_helper'

RSpec.describe CustomerFeedback, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
