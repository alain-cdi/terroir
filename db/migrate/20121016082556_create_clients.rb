class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :prenom
      t.string :nom
      t.string :adresse
      t.string :code_postal
      t.string :ville
      t.string :mail

      t.timestamps
    end
  end
end
