require 'doorkeeper/grape/helpers'

module API
  module V1
    class Me < Grape::API
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

      get 'me' do
        # respond_with current_resource_owner
        current_customer.as_json
      end

      private

      def current_resource_owner
        Customer.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end
