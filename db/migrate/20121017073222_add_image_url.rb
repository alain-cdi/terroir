class AddImageUrl < ActiveRecord::Migration
  def up
    add_column :produits, :image_url, :string
  end

  def down
    remove_column(:produits, :image_url)
  end
end
