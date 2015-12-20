class Customers::HomeController < ApplicationController
  before_filter :authenticate_customer!

  def index
    @personal_info_props = {
      first_name: current_customer.first_name,
      last_name: current_customer.last_name,
      email: current_customer.email
    }
  end
end
