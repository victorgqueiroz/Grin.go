class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :place, null: false, foreign_key: true
      t.references :user, null: false
      t.references :guider, null: false

      t.timestamps
    end
  end
  add_foreign_key :matches, :users, column: :user
  add_foreign_key :matches, :users, column: :guider
end
