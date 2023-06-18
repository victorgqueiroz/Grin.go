class RemovePlaceToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :place_id, :bigint

    add_reference :places, :user, foreign_key: true
  end
end
