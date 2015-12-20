class AddBarcodeIdToBarcodeType < ActiveRecord::Migration
  def change
    add_reference :barcode_types, :barcode, index: true, foreign_key: true
  end
end
