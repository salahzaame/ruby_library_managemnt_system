class Document < ApplicationRecord
    #has_many :emprunts # Un document peut être emprunté plusieurs fois
    validates :titre , presence: true # Un document doit avoir un titre
    validates :document_type , presence: true # Un document doit avoir un type
    validates :author, presence: true # Un document doit avoir un auteur
end
