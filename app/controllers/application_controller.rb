class ApplicationController < ActionController::Base
  private

  def authorize
    unless Producteur.find_by_id(session[:producteur_id])
      flash[:notice] = "Please log in"
      redirect_to(:controller => "store", :action => "login")
    end
  end
end
