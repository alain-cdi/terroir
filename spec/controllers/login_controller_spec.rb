require 'spec_helper'

describe LoginController do

  describe "GET 'add_producteur'" do
    it "should be successful" do
      get 'add_producteur'
      response.should be_success
    end
  end

  describe "GET 'login'" do
    it "should be successful" do
      get 'login'
      response.should be_success
    end
  end

  describe "GET 'logout'" do
    it "should be successful" do
      get 'logout'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'delete_producteur'" do
    it "should be successful" do
      get 'delete_producteur'
      response.should be_success
    end
  end

  describe "GET 'list_producteurs'" do
    it "should be successful" do
      get 'list_producteurs'
      response.should be_success
    end
  end

end
