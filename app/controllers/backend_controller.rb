class BackendController < ApplicationController
  

  wsdl_service_name 'Backend'
  web_service_api ProduitApi
  web_service_scaffold :invoke

  def find_all_produits
    Produit.find(:all).map{ |produit| produit.id }
  end
  def find_produit_by_id(id)
    Produit.find(id)
  end
end
