class Customer::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:email)
  end

  def sign_up
    default_params.permit(:first_name, :last_name, :email,
                          :phone_number, :city, :country)
  end
end
