class I18nKey < ActiveRecord::Base
  has_many :translations
  has_one :i18n_name, class_name: 'ShopType', foreign_key: 'i18n_name_id'
  has_one :i18n_description, class_name: 'ShopType',
  		   foreign_key: 'i18n_description_id'
end
