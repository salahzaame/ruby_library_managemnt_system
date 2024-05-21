class EmpruntsController < ApplicationController
  before_action :authenticate, :only => [:index, :new, :create]
  before_action :admin, :only => [:destroy, :index, :new, :create]


  def show
    @emprunt = Emprunt.find(params[:id])
  end


  def destroy
    Emprunt.find(params[:id]).destroy
    flash[:sucess] = "Emprunt supprimé"
    redirect_to emprunts_path
  end
  def new
    @emprunt = Emprunt.new
  end

  def authenticate
    unless logged_in?
      flash[:alert] = "Connectez-vous pour accéder à cette page"
      redirect_to login_path
    end
  end

  def create
    if current_user.admin? && params[:emprunt][:user_id].present?
      @user = User.find(params[:emprunt][:user_id])
    else
      @user = current_user
    end
    @emprunt = @user.emprunts.build(emprunt_params)
    if @emprunt.save
      flash[:success] = "Emprunt créé avec succès"
      redirect_to emprunts_path
    else
      flash.now[:alert] = "Erreur lors de la création de l'emprunt"
      render :new
    end
  end

  def index
    @emprunts = Emprunt.paginate(page: params[:page], per_page: 5) # Affichage de tous les emprunts
  end

  def search_by_id
    @emprunt = Emprunt.find_by(id: params[:id])
    if @emprunt
      render :show
    else
      flash.now[:alert] = "Emprunt introuvable"
      render :search
    end
  end

  def emprunt_params
    params.require(:emprunt).permit(:date_emprunt, :date_retour, :user_id, :document_id)
  end

end




 
