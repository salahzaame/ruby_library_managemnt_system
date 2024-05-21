class OrdinateursController < ApplicationController
  def new
    @ordinateur = Ordinateur.new
  end

  def create
    ordinateur = Ordinateur.new(ordinateur_params)
    if ordinateur.save
      flash[:success] = "Ordinateur créé avec succès"
      redirect_to ordinateur
    else
      flash.now[:alert] = "Erreur lors de la création de l'ordinateur"
      render :new
    end
  end

  def index
    @ordinateurs = Ordinateur.paginate(page: params[:page], per_page: 5)
  end

  def show
    @ordinateur = Ordinateur.find(params[:id])
  end

  def destroy
    Ordinateur.find(params[:id]).destroy
    flash[:sucess] = "Ordinateur supprimé"
    redirect_to root_url
  end

  def ordinateur_params
    params.require(:ordinateur).permit(:marque, :modele)
  end

  def search_by_id
    @ordinateur = Ordinateur.find_by(id: params[:id])
    if @ordinateur
      render :show
    else
      flash.now[:alert] = "Ordinateur introuvable"
      render :search
    end
  end

  
end
