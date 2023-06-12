class AddFkToMatches2 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :matches, :users, column: :user
    add_foreign_key :matches, :users, column: :guider
  end
end
