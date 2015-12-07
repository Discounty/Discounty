class ShopType < ActiveRecord::Base
  belongs_to :i18n_name, class_name: 'I18nKey'
  belongs_to :i18n_description, class_name: 'I18nKey'
end
