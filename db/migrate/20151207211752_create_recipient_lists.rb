class CreateRecipientLists < ActiveRecord::Migration
  def change
    create_table :recipient_lists do |t|
      t.references :ad_campaign, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
