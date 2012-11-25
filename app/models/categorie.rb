class Categorie < ActiveRecord::Base
  attr_accessible :libelle

  has_many :produits
end
