# == Schema Information
#
# Table name: i18n_keys
#
#  id         :integer          not null, primary key
#  key_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class I18nKey < ActiveRecord::Base
  has_many :translations
  has_one :i18n_name, class_name: 'ShopType', foreign_key: 'i18n_name_id'
  has_one :i18n_description, class_name: 'ShopType',
  		   foreign_key: 'i18n_description_id'
end
