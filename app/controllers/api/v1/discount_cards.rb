require 'doorkeeper/grape/helpers'

module API
  module V1
    class DiscountCards < Grape::API
      helpers Doorkeeper::Grape::Helpers

      helpers do

        def current_customer
          @current_customer ||=
            Customer.find(doorkeeper_token.resource_owner_id)
        end
      end
      include API::Errors
      include API::V1::Defaults

      before do
        doorkeeper_authorize! :customer
      end

      resource 'discount_cards' do

        desc 'Get the discount card of certain id'
        params do
          requires :id, type: Integer
        end
        get ':id' do
          current_customer.discount_cards.find(params[:id])
            .as_json(include: :barcode).to_json
        end

        desc 'Create new discount card for the authenticated customer'
        params do
          requires :name, type: String
          requires :description, type: String
          requires :barcode_type, type: String
          requires :barcode, type: String
          requires :discount_percentage, type: Float
          requires :extra_info, type: String
          requires :shop, type: String
        end
        post 'new' do
          # permitted_params = declared(params, include_missing: false)
          ActiveRecord::Base.transaction do
            barcode_type = BarcodeType.find_by(
              barcode_type: params[:barcode_type])
            unless barcode_type
              barcode_type = BarcodeType.create!(
                barcode_type: params[:barcode_type])
            end

            barcode = Barcode.new
            barcode.barcode = params[:barcode]
            barcode.discount_percentage = params[:discount_percentage]
            barcode.extra_info = params[:extra_info]
            barcode.barcode_type = barcode_type

            shop = Shop.find_by(name: params[:shop])

            card = DiscountCard.new(
              name: params[:name],
              description: params[:description],
              customer: current_customer
            )
            if shop
              card.shop = shop
            else
              card.unregistered_shop = params[:shop]
            end
            card.barcode = barcode
            barcode.save!
            card.save!
            card
          end
        end
      end
    end
  end
end