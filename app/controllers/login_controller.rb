class LoginController < ApplicationController

  layout "store"  #

  #START:authorize
  #  before_filter :authorize, :except => :login
  # . .
  #END:authorize
def index
  
end


  # just display the form and wait for producteur to
  # enter a name and password
  #START:login
  def login
    session[:producteur_id] = nil
    if request.post?
      producteur = Producteur.authenticate(params[:nom], params[:password])
      if producteur
        session[:producteur_id] = producteur.id
        redirect_to(:action => "index")
      else
        flash[:notice] = "Couple utilisateur / mot de passe invalide"
      end
      
    end
    flash[:notice] = "NON POST Test !!"
  end
  #END:login

 

  def delete_producteur
    id = params[:id]
    if id && producteur = Producteur.find(id)
      begin
        producteur.destroy
        flash[:notice] = "Supression de l'utilisateur #{producteur.nom} effectuée."
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => login)
  end

  def logout
    session[:producteur_id] = nil
    flash[:notice] = "Déconnection"
    redirect_to(:action => "login")
  end
end
