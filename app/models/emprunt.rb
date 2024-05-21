class Emprunt < ApplicationRecord
    belongs_to :user  # Un emprunt appartient à un utilisateur
    belongs_to :document # Un emprunt appartient à un document
   # belongs_to :material # Un emprunt appartient à un material 


    private 
    def max_documents
        if user.emprunts.count >= 5
            errors.add(:base, "Vous avez atteint le nombre maximum d'emprunts")
        end
    end
end

