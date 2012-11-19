class HelloMessageController < ApplicationController

 

  def hello_message(firstname, lastname)
    return "Hello "+ firstname +" "+lastname
  end
end