
require File.dirname(__FILE__) + '/../test_helper'
require 'layered_backend_controller'

class LayeredBackendController
  def rescue_action(e)
    raise e
  end
end

class BackendControllerApiTest < Test::Unit::TestCase
  fixtures :produits

  def setup
    @controller = LayeredBackendController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @protocool  = :soap
  end

  def test_find_all_produits
    result = invoke_layered :produit, :find_all_produits
    assert result[0].is_a?(Integer)
  end

  def test_find_produit_by_id
    produit = invoke_layered :produit, :find_produit_by_id, 2
    assert_equal 'produit 2', produit.description
  end

  
end
