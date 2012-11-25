
class ProduitService < ActionWebService::Base
  web_service_api ProduitApi

  def find_all_produits
    Produit.find(:all).map{ |produit| produit.id }
  end

  def find_produit_by_id(id)
    Produit.find(id)
  end
end
