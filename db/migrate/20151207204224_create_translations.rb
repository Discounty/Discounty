class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :translation
      t.references :i18n_key, index: true, foreign_key: true
      t.references :locale, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
