require 'digest/sha1'

class Producteur < ActiveRecord::Base

  validates :nom, :presence => true

  validates :nom, :uniqueness => true

  validates :password, :confirmation => true

  #validate :password_non_blank
  #,     :unless => Producteur.new { |a| a.password.blank? }

  attr_accessible :adresse, :code_postal, :info, :libelle, :mail, :nom, :prenom, :site, :ville, :password, :password_confirmation
has_many :produits

  attr_accessor :password_confirmation

  def validate
    errors.add_to_base("Mot de passe manquant") if hashed_password.blank?
  end

  #START:login
  def self.authenticate(nom, password)
    producteur = self.find_by_nom (nom)
    if producteur
      expected_password = encrypted_password(password, producteur.salt)
      if producteur.hashed_password != expected_password
        producteur = nil
      end
    end
    producteur
  end
  #END:login

  # 'password' is a virtual attribute
  #START:accessors
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    create_new_salt
    self.hashed_password = Producteur.encrypted_password(self.password, self.salt)
  end
  #END:accessors


  #START:encrypted_password
  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt  # 'wibble' makes it harder to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end
  #END:encrypted_password


  #START:create_new_salt
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  #END:create_new_salt

end
