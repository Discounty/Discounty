require "administrate/base_dashboard"

class ShopTypeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    i18n_name: Field::BelongsTo.with_options(class_name: "I18nKey"),
    i18n_description: Field::BelongsTo.with_options(class_name: "I18nKey"),
    shop: Field::BelongsTo,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    i18n_name_id: Field::Number,
    i18n_description_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :i18n_name,
    :i18n_description,
    :shop,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :i18n_name,
    :i18n_description,
    :shop,
    :id,
    :created_at,
    :updated_at,
    :i18n_name_id,
    :i18n_description_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :i18n_name,
    :i18n_description,
    :shop,
    :i18n_name_id,
    :i18n_description_id,
  ].freeze

  # Overwrite this method to customize how shop types are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(shop_type)
  #   "ShopType ##{shop_type.id}"
  # end
end
