class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :photo
      t.string :legend

      t.timestamps
    end
  end
end
