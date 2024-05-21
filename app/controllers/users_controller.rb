class UsersController < ApplicationController
  before_action :authenticate, :only => [:index, :edit, :update, :destroy]
  before_action :good_user,  only: [:edit, :update]
  before_action :user_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5) # Affichage de tous les utilisateurs
  end

  def show
    @user = User.find(params[:id]) # Affichage d'un utilisateur
  end

  def edit
    @user = User.find(params[:id]) # Edition d'un utilisateur
  end
  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé"
    redirect_to users_path
  end

  def user_admin
    @user = User.find(params[:id]) # Affichage d'un utilisateur
    if not @current_user.admin? || @user == @current_user
      redirect_to root_path
    end
  end

  def authenticate 
    unless logged_in?
      flash[:alert] = "Connectez-vous pour accéder à cette page"
      redirect_to login_path
    end
  end

  def search_by_id
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      flash.now[:alert] = "Utilisateur introuvable"
      render :search
    end
  end


  def good_user
    @user = User.find(params[:id]) # Affichage d'un utilisateur
    redirect_to root_path unless @user == @current_user
  end
end


