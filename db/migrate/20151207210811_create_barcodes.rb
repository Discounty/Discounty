class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.string :barcode
      t.float :discount_percentage
      t.string :extra_info
      t.references :barcode_type, index: true, foreign_key: true
      t.references :discount_card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
