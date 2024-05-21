class CreateOrdinateurs < ActiveRecord::Migration[7.0]
  def change
    create_table :ordinateurs do |t|

      t.timestamps
    end
  end
end
