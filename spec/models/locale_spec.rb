# == Schema Information
#
# Table name: locales
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Locale, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
