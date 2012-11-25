# To change this template, choose Tools | Templates
# and open the template in the editor.



class HelloMessageApi < ActionWebService::API::Base


  api_method :hello_message, :expects => [{:firstname=>:string},
{:lastname=>:string}], :returns => [:string]


end
