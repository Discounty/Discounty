class Translation < ActiveRecord::Base
  belongs_to :i18n_key
  belongs_to :locale
end
