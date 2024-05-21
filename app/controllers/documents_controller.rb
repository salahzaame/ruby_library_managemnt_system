class DocumentsController < ApplicationController
  before_action :admin , only: [:new, :create, :destroy]

  def new
    @document = Document.new
  end
  def index 
    @documents = Document.paginate(page: params[:page], per_page: 5)
    @document = Document.new
  end



  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = "Document créé avec succès"
      redirect_to @document
    else
      flash.now[:alert] = "Erreur lors de la création du document"
      render :new
    end
  end

  def show
    @document = Document.find(params[:id])
  end

  def destroy
    Document.find(params[:id]).destroy
    flash[:success] = "Document supprimé"
    redirect_to documents_path
  end

  def search_by_id
    @document = Document.find_by(id: params[:document][:id])
    if @document
      render :show
    else
      flash.now[:alert] = "Document introuvable"
      render :search
    end
  end
  private

  def document_params
    params.require(:document).permit(:titre, :document_type, :author)
  end
end
