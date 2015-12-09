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

class Locale < ActiveRecord::Base
  belongs_to :translation
end
