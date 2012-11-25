class AddProducteurPwd < ActiveRecord::Migration
  def change
    add_column :producteurs, :hashed_password, :string
    add_column :producteurs, :salt, :string
  end

end
