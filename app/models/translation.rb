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

class Translation < ActiveRecord::Base
  belongs_to :i18n_key
  has_one :locale
end
