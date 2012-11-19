class StoreController < ApplicationController
  def index
     @produits = Produit.find_produits_client
  end
end
