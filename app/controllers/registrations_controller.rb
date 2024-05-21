class RegistrationsController < ApplicationController
  def new
    @user = User.new  # Création d'un nouvel utilisateur
  end

  def create
    @user = User.new(user_params)  # Création d'un nouvel utilisateur avec les paramètres de l'utilisateur
    if @user.save  
      flash[:notice] = "Inscription réussie"
      session[:user_id] = @user.id  # Stockage de l'identifiant encrypted de l'utilisateur dans la session
      redirect_to root_path  # Redirection vers la page d'accueil  
    else
      flash[:alert] = "Erreur lors de l'inscription" 
      render 'new'  # Affichage du formulaire d'inscription
    end
  end

  private 
  def user_params
    params.require(:user).permit(:nom , :prenom , :email , :password , :password_confirmation) # Paramètres de l'utilisateur
  end
end
