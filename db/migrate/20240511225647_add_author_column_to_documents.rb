class AddAuthorColumnToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :author, :string, null: true
  end
end
