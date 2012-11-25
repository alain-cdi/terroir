
class ProduitAuthApi < ActionWebService::API::Base
  api_method :find_all_produits,
             :expects => [{:key=>:string}],
             :returns => [[:int]]

  api_method :find_produit_by_id,
             :expects => [{:key=>:string}, {:id=>:int}],
             :returns => [Product]
end
