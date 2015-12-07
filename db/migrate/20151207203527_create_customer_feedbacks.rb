class CreateCustomerFeedbacks < ActiveRecord::Migration
  def change
    create_table :customer_feedbacks do |t|
      t.text :feedback
      t.integer :rating
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
