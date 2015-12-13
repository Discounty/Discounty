class CreateDiscountCards < ActiveRecord::Migration
  def change
    create_table :discount_cards do |t|
      t.string :name
      t.string :description
      t.references :shop, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
