require 'doorkeeper/grape/helpers'

module API
  module V1
    class Customers < Grape::API
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

      # before_action -> { doorkeeper_authorize! :customer }, only: :index
      # before_action only: [:create, :update, :destroy] do
      #   doorkeeper_authorize! :admin
      # end

      resource :customers do

        desc 'Get info about current customer'
        params {}
        get 'me' do
          current_customer.as_json
        end

        desc "Get all customer's discount cards with barcodes"
        get 'full_info' do
          current_customer.as_json(include:
            { discount_cards: {
              include: {
                barcode: {
                  include: :barcode_type
                }
               }
            }
          })
        end

        desc "Update current customer's info"
        put 'update' do
          current_customer.first_name =
            params[:first_name] if params[:first_name]

          current_customer.last_name = params[:last_name] if params[:last_name]
          current_customer.country = params[:country] if params[:country]
          current_customer.city = params[:city] if params[:city]

          current_customer.phone_number =
            params[:phone_number] if params[:phone_number]

          current_customer.password = params[:password] if params[:password]

          current_customer.save!
          current_customer.as_json
        end
      end

      private

      def current_customer
        @current_customer ||= Customer.find(doorkeeper_token.resource_owner_id)
      end
    end
  end
end
