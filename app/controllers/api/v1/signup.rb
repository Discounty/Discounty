module API
  module V1
    class Signup < Grape::API
      helpers do

        def current_customer
          @current_customer ||=
            Customer.find(doorkeeper_token.resource_owner_id)
        end
      end
      include API::Errors
      include API::V1::Defaults

      resource 'signup' do

        desc 'Signup as a customer'
        params do
          requires :email, type: String, desc: "New customer's email"
          requires :password, type: String, desc: "New customer's password"
          requires :first_name, type: String, desc: "New customer's first name"
        end
        post 'customer' do
          first_name = params[:first_name]
          last_name = params[:last_name]
          email = params[:email]
          password = params[:password]
          customer = Customer.new(first_name: first_name, last_name: last_name,
                                  email: email, password: password)
          customer.skip_confirmation!
          customer.skip_confirmation_notification!
          customer.save!
        end
      end
    end
  end
end
