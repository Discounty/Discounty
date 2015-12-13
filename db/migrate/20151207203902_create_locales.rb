class CreateLocales < ActiveRecord::Migration
  def change
    create_table :locales do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
