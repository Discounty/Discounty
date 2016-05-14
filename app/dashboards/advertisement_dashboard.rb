require "administrate/base_dashboard"

class AdvertisementDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ad_campaign: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    ad_data: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    content: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :ad_campaign,
    :id,
    :name,
    :ad_data,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :ad_campaign,
    :id,
    :name,
    :ad_data,
    :created_at,
    :updated_at,
    :content,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ad_campaign,
    :name,
    :ad_data,
    :content,
  ].freeze

  # Overwrite this method to customize how advertisements are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(advertisement)
  #   "Advertisement ##{advertisement.id}"
  # end
end
