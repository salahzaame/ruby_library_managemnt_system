class SessionsController < ApplicationController
  def destroy
    log_out 
    redirect_to root_url
  end
  
  def create 
    user = User.find_by(email: params[:session][:email].downcase) # on cherche l'utilisateur par son email
    if user && user.authenticate(params[:session][:password])
      log_in user  # on connecte l'utilisateur
      #session[:user_id] = user.id  # on stocke l'id de l'utilisateur dans la session
      redirect_to root_url(user: user.nom)   # on redirige vers la page de l'utilisateur
      
    else 
      flash[:danger] = 'Combinaison email/mot de passe invalide'
      render 'new'
    end
  end
end
