class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :city
      t.string :country
      t.string :neighborhood

      t.timestamps
    end
  end
end
