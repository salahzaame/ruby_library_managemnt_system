class ChangeNullEmprunts < ActiveRecord::Migration[7.0]
  def change
        change_column_null :emprunts, :user_id, true
        change_column_null :emprunts, :document_id, true
        change_column_null :emprunts, :ordinateur_id, true
  end
end
