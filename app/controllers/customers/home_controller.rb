class Customers::HomeController < ApplicationController
  before_filter :authenticate_customer!

  def index
    # @personal_info_props = {
    #   first_name: current_customer.first_name,
    #   last_name: current_customer.last_name,
    #   email: current_customer.email
    # }
    @customer_dashboard_props = {
      cards: [
        {
          cardName: 'Card 1',
          cardBarcode: '123456789'
        },
        {
          cardName: 'Card 2',
          cardBarcode: '987654321'
        }
      ],
      navigationLinks: [
        {
          linkName: 'about'
        },
        {
          linkName: 'coupons'
        }
      ]
    }
  end
end
