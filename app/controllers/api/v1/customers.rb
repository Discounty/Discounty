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
      include API::V1::Defaults

      before do
        doorkeeper_authorize! :customer
      end

      # before_action -> { doorkeeper_authorize! :customer }, only: :index
      # before_action only: [:create, :update, :destroy] do
      #   doorkeeper_authorize! :admin
      # end

      resource :customers do
        desc 'Return list of customers'
        get do
          Customer.all
        end

        get 'first' do
          Customer.fisrt
        end

        get 'me' do
          current_customer
        end

        post 'me' do
          current_customer
        end
      end

      private

      def current_customer
        @current_customer ||= Customer.find(doorkeeper_token.resource_owner_id)
      end
    end
  end
end
