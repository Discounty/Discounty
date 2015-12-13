require 'doorkeeper/grape/helpers'

module API
  module V1
    class Customers < Grape::API
      helpers Doorkeeper::Grape::Helpers
      include API::V1::Defaults

      before do
        doorkeeper_authorize!
      end

      resource :customers do
        desc 'Return list of customers'
        get do
          Customer.all
        end

        get 'first' do
          Customer.fisrt
        end
      end
    end
  end
end
