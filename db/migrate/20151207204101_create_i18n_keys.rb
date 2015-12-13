class CreateI18nKeys < ActiveRecord::Migration
  def change
    create_table :i18n_keys do |t|
      t.string :key_name

      t.timestamps null: false
    end
  end
end
