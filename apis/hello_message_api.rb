# To change this template, choose Tools | Templates
# and open the template in the editor.



class HelloMessageApi < ActionWebService::API::Base
   web_service_api HelloMessageApi
  web_service_dispatching_mode :direct
  wsdl_service_name 'hello_message'
  web_service_scaffold :invoke

  api_method :hello_message, :expects => [{:firstname=>:string},
{:lastname=>:string}], :returns => [:string]


end
