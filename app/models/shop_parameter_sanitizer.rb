class Shop::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:email)
  end

  def sign_up
    default_params.permit(:name, :description, :chain_store,
                          :email, :address, :city, :country)
  end
end
