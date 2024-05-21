class AuthorsController < ApplicationController
  before_action :admin , only: [:new, :create, :destroy]
  def new
    @author = Author.new
  end

  def create 
    author = Author.new(author_params)
    if author.save
      flash[:success] = "Auteur créé avec succès"
      redirect_to author
    else
      flash.now[:alert] = "Erreur lors de la création de l'auteur"
      render :new
    end
  end

  def index
    @authors = Author.paginate(page: params[:page], per_page: 5)
  end

  def show
    @author = Author.find(params[:id])
  end

  def destroy
    Author.find(params[:id]).destroy
    flash[:sucess] = "Auteur supprimé"
    redirect_to root_url
  end

  def search_by_id
    @author = Author.find_by(id: params[:id])
    if @author
      render :show
    else
      flash.now[:alert] = "Auteur introuvable"
      render :search
    end 
  end
  
  def author_params
    params.require(:author).permit(:nom, :prenom, :email)
  end
end
