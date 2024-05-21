class AddContentToOrdinateur < ActiveRecord::Migration[7.0]
  def change
    add_column :ordinateurs, :marque, :string
    add_column :ordinateurs, :modele, :string
  end
end
