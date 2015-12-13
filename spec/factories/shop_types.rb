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

FactoryGirl.define do
  factory :shop_type do
    
  end

end
