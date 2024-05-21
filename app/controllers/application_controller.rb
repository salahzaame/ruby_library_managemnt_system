class ApplicationController < ActionController::Base
    include SessionsHelper
    #protect_from_forgery with: :null_session


    def admin 
        unless current_user.admin?
            flash[:alert] = "Vous n'avez pas les droits pour accéder à cette page"
            redirect_to root_path
        end
    end
end
