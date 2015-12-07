class CreateAdCampaigns < ActiveRecord::Migration
  def change
    create_table :ad_campaigns do |t|
      t.text :description
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
