module API
  module V1
    class Customers < Grape::API
      include API::V1::Defaults

      resource :customers do
        desc 'Return list of customers'
        get do
          Customer.all
        end
      end
    end
  end
end
