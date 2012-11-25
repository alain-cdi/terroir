class LayeredBackendController < ApplicationController
  web_service_dispatching_mode :layered
  web_service_scaffold :invoke
  web_service :produit, ProduitService.new
 # web_service(:order) { OrderService.new }
end
