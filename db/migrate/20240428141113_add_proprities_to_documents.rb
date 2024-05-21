class AddPropritiesToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :titre, :string
    add_column :documents, :type, :string
  end
end
