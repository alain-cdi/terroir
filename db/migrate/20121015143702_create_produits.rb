class CreateProduits < ActiveRecord::Migration
  def self.up
    create_table :produits do |t|
      t.integer :id_cat
      t.string :libelle
      t.integer :prix
      t.text :description

      t.timestamps
    end
  end
  def self.down
    drop_table :produits
  end
end
