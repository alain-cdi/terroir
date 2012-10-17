class CreateProducteurs < ActiveRecord::Migration
  def change
    create_table :producteurs do |t|
      t.string :prenom
      t.string :nom
      t.string :libelle
      t.text :info
      t.string :adresse
      t.string :code_postal
      t.string :ville
      t.string :mail
      t.string :site

      t.timestamps
    end
  end
end
