# == Schema Information
#
# Table name: i18n_keys
#
#  id         :integer          not null, primary key
#  key_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :i18n_key do
    key_name "MyString"
  end

end
