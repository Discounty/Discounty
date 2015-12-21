module API
  module V1
    class Base < Grape::API
      mount API::V1::Customers
      mount API::V1::Me
      mount API::V1::DiscountCards
      mount API::V1::Signup

      add_swagger_documentation base_path: '/api',
                                api_version: 'v1',
                                hide_documentation_path: true
    end
  end
end
