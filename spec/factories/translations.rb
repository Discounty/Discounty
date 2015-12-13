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

FactoryGirl.define do
  factory :translation do
    translation "MyString"
i18n_key nil
locale nil
  end

end
