require 'doorkeeper/grape/helpers'

module API
  module V1
    class Me < Grape::API
      # before_action :doorkeeper_authorize!
      helpers Doorkeeper::Grape::Helpers
      include API::V1::Defaults

      get 'me' do
        # respond_with current_resource_owner
        current_customer
      end

      private

      def current_resource_owner
        Customer.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end
