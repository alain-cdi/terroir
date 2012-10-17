class Producteur < ActiveRecord::Base
  attr_accessible :adresse, :code_postal, :info, :libelle, :mail, :nom, :prenom, :site, :ville
  has_many :produits
end
