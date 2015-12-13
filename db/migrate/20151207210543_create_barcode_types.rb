class CreateBarcodeTypes < ActiveRecord::Migration
  def change
    create_table :barcode_types do |t|
      t.string :barcode_type

      t.timestamps null: false
    end
  end
end
