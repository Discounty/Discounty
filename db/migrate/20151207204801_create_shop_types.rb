class CreateShopTypes < ActiveRecord::Migration
  def change
    create_table :shop_types do |t|

      t.timestamps null: false
    end

    add_column :shop_types, :i18n_name_id, :integer
    add_column :shop_types, :i18n_description_id, :integer
  end
end
