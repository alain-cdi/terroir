
class Produit_api< ActionWebService::API::Base
  api_method :find_all_produits,
             :returns => [[:int]]
  api_method :find_produit_by_id,
             :expects => [:int],
             :returns => [Produit]
end
