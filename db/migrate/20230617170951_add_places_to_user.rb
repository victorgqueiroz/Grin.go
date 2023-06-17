class AddPlacesToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :place, foreign_key: true
  end
end
