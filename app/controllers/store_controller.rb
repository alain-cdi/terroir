class StoreController < ApplicationController
  def index
     @produits = Produit.all
  end

  #Affichaqe que les fromages
  def fromage
    @produits = Produit.find_all_by_id_cat (1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @produits }
    end
  end

  #Affichaqe que les charcuteries
  def charcuterie
    @produits = Produit.find_all_by_id_cat (2)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @produits }
    end
  end

     # just display the form and wait for producteur to
  # enter a name and password
  #START:login
  def login
    session[:producteur_id] = nil
    if request.post?
      producteur = Producteur.authenticate(params[:nom], params[:password])
      if producteur
         flash[:notice] = "Authentifié !!"
        session[:producteur_id] = producteur.id
        redirect_to(:controller => "produits", :action => "index")
      else
        flash[:notice] = "Couple utilisateur / mot de passe invalide"
      end
    else
       
    end
   
  end
  #END:login

     #START:add_producteur
  def add_producteur
    @producteur = Producteur.new(params[:producteur])
    if request.post? and @producteur.save
      flash.now[:notice] = "Création de l'utilisateur #{@producteur.nom} effectuée."
      @producteur = Producteur.new
      redirect_to(:controller => "producteurs", :action => "index")
    end
  end
  #END:add_producteur


end
