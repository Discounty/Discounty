class AddContentToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :content, :text
  end
end
