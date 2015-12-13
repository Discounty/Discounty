class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.text :description
      t.references :barcode, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
