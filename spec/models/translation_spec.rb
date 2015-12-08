# == Schema Information
#
# Table name: translations
#
#  id          :integer          not null, primary key
#  translation :string
#  i18n_key_id :integer
#  locale_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Translation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
