class Customers::CardsController < ApplicationController
  before_filter :authenticate_customer!

  def update
    if customer_signed_in?

      card = current_customer.discount_cards.find(params[:id])

      name = params[:name] if params[:name]
      desc = params[:description] if params[:description]
      # shop_name = params[:shopName] if params[:shopName] && card.shop

      card.update_attributes(name: name, description: desc)

      card.save!
      current_customer.save!

      render json: { status: 'updated', object: card.to_json }
    else
      render json: { status: 'failed', errors: ['error'] }
    end
  end

  def destroy
    if customer_signed_in?
      card = current_customer.discount_cards.find(params[:id])

      card.destroy! if card

      render json: { status: 'destroyed', object: card.to_json }
    end
  end
end
