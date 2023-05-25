class AddReferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :host, null: false, foreign_key: true
    add_reference :users, :visitor, null: false, foreign_key: true
  end
end
