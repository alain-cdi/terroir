class BackendController < ApplicationController
  web_service_scaffold :invoke
  wsdl_service_name 'Backend'
  web_service_dispatching_mode :direct
  web_service_api ProduitApi
  

  def find_all_produits
    Produit.find(:all).map{ |produit| produit.id }
  end

  def find_produit_by_id(id)
    Produit.find(id)
  end
end
