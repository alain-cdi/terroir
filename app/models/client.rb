class Client < ActiveRecord::Base
  attr_accessible :adresse, :code_postal, :mail, :nom, :prenom, :ville
end
