class LoginController < ApplicationController
# before_filter :authorize, :except=> :login
  layout "application"
  
  # just display the form and wait for user to
  # enter a name and password
  #START:login
  def login
     session[:producteur_id] = nil
    if request.post?
      producteur = Producteur.authenticate(params[:nom], params[:password])
     
      if producteur
        session[:producteur_id] = producteur.id
        session[:producteur_nom] = producteur.nom
        #test
        #@nom_producteur=Producteur.nom.find(session[:producteur_id])
        
        #fin
        redirect_to(:action => "index")
      else
        flash[:notice] = "Couple producteur / mot de passe invalide"
      end
    end
  end
  #END:login

  def add_producteur
    @producteur=Producteur.new(params[:producteur])
    if request.post? and @producteur.save
      flash.now[:notice]="Producteur #{@producteur.nom} cree"
      @producteur=Producteur.new
    end
  end


  def logout
    session[:producteur_id]=nil
    flash[:notice]="Deconnecte"
    redirect_to(:action=>"login")
    
  end

  def index
    @total_produits = Produit.count
  end

  def delete_producteur
    if request.post?
      producteur=Producteur.find(params[:id])
      producteur.destroy
    end
    redirect_to(:action=>:list_producteurs)
  end

  def list_producteurs
    @all_producteurs=Producteur.find(:all)
  end
end
