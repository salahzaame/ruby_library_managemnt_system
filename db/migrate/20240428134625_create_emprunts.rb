class CreateEmprunts < ActiveRecord::Migration[7.0]
  def change
    create_table :emprunts do |t|

      t.timestamps
    end
  end
end
