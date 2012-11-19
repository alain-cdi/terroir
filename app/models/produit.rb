class Produit < ActiveRecord::Base
  attr_accessible :description, :id_cat, :libelle, :prix, :image_url
  validates :description, :length => { :maximum => 100 }
  validates :libelle, :presence=> true,
    :length => { :maximum => 50 },
    :uniqueness => true
  validates( :prix, :presence  => true)

  validates_format_of(:image_url, :with => %r{\.(gif|jpg|png)$}i, :message => "doit être l'URL d'une image GIF, JPG ou PNG")
  validates_numericality_of(:prix)

  def self.find_produits_client
    find(:all, :order=>"libelle")
  end

  protected
  def validate
    errors.add(:prix, "doit être au moins 0.01") if prix.nil?||price<0.01
  end
end
