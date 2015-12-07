class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :chain_store
      t.text :address
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
