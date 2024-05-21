class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :password_digest

      t.timestamps # ajoute 2 colonnes created_at et updated_at
    end
  end
end
