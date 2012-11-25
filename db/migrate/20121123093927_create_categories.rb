class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
