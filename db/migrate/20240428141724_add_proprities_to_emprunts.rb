class AddPropritiesToEmprunts < ActiveRecord::Migration[7.0]
  def change
    add_reference :emprunts, :user, null: false, foreign_key: true
    add_reference :emprunts, :document, null: false, foreign_key: true
    add_reference :emprunts, :ordinateur, null: false, foreign_key: true
    add_column :emprunts, :date_emprunt, :date
    add_column :emprunts, :date_retour, :date
  end
end
