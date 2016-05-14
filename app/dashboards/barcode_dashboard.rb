require "administrate/base_dashboard"

class BarcodeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    discount_card: Field::BelongsTo,
    barcode_type: Field::BelongsTo,
    id: Field::Number,
    barcode: Field::String,
    discount_percentage: Field::Number.with_options(decimals: 2),
    extra_info: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :discount_card,
    :barcode_type,
    :id,
    :barcode,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :discount_card,
    :barcode_type,
    :id,
    :barcode,
    :discount_percentage,
    :extra_info,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :discount_card,
    :barcode_type,
    :barcode,
    :discount_percentage,
    :extra_info,
  ].freeze

  # Overwrite this method to customize how barcodes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(barcode)
  #   "Barcode ##{barcode.id}"
  # end
end
