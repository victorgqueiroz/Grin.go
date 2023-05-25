class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :cities
      t.string :countries
      t.string :neighborhood

      t.timestamps
    end
  end
end
