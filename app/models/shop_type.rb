# == Schema Information
#
# Table name: shop_types
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  i18n_name_id        :integer
#  i18n_description_id :integer
#  shop_id             :integer
#

class ShopType < ActiveRecord::Base
  belongs_to :i18n_name, class_name: 'I18nKey'
  belongs_to :i18n_description, class_name: 'I18nKey'
  belongs_to :shop
end
