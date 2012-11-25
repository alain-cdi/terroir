class BackendAuthController < ApplicationController
  
  wsdl_service_name 'Backend'
#  web_service_dispatching_mode :direct
  web_service_api ProduitAuthApi
  web_service_scaffold :invoke
  before_invocation :authenticate

  def find_all_produits(key)
    Produit.find(:all).map{ |produit| produit.id }
  end

  def find_produit_by_id(key, id)
    Produit.find(id)
  end

  protected
  def authenticate(name, args)
    raise "No authenticated" unless args[0]=='secret'
  end
end
