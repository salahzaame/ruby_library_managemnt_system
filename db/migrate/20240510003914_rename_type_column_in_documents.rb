class RenameTypeColumnInDocuments < ActiveRecord::Migration[7.0]
  def change
    rename_column :documents, :type, :document_type
  end
end
