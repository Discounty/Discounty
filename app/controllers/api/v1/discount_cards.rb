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
      include API::V1::Defaults

      before do
        doorkeeper_authorize! :customer
      end

      resource 'discount_cards' do

        desc 'Create new discount card for the authenticated customer'
        post 'new' do
          permitted_params = declared(params, include_missing: false)
          puts 'PARAMS:\n'
          puts permitted_params.inspect

          ActiveRecord::Base.transaction do

            barcode_type = BarcodeType.find_by(
              barcode_type: params[:barcode_type])
            unless barcode_type
              barcode_type = BarcodeType.create!(
                barcode_type: params[:barcode_type])
            end

            # barcode = Barcode.new(
            #   barcode: params[:barcode],
            #   discount_percentage: params[:discount_percentage],
            #   extra_info: params[:extra_info],
            #   barcode_type: barcode_type
            # )
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