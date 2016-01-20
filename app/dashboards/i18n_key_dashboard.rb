require "administrate/base_dashboard"

class I18nKeyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    translations: Field::HasMany,
    i18n_name: Field::HasOne,
    i18n_description: Field::HasOne,
    id: Field::Number,
    key_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :translations,
    :i18n_name,
    :i18n_description,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :translations,
    :i18n_name,
    :i18n_description,
    :key_name,
  ]

  # Overwrite this method to customize how i18n keys are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(i18n_key)
  #   "I18nKey ##{i18n_key.id}"
  # end
end
