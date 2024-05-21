class User < ApplicationRecord
 # Un utilisateur peut avoir plusieurs emprunts
    has_many :emprunts
    
    validates :nom , presence: true , length: {maximum: 50}
    validates :prenom , presence: true , length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email , presence: true , length: {maximum: 255} , 
        format: {with: VALID_EMAIL_REGEX , message: "Format d'email invalide"} ,
        uniqueness: {case_sensitive: false}
    
    has_secure_password  # Ajout de la méthode has_secure_password pour le hachage du mot de passe
    validates :password , presence: true , length: {minimum: 6} 
    
end
