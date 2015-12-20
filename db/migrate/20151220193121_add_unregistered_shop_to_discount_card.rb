class AddUnregisteredShopToDiscountCard < ActiveRecord::Migration
  def change
    add_column :discount_cards, :unregistered_shop, :string
  end
end
