class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :name
      t.json :ad_data
      t.references :ad_campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
