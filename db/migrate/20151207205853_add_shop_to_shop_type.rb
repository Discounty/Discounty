class AddShopToShopType < ActiveRecord::Migration
  def change
    add_reference :shop_types, :shop, index: true, foreign_key: true
  end
end
