class Translation < ActiveRecord::Base
  belongs_to :i18n_key
  has_one :locale
end
