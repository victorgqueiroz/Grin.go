class AddUserToPlace < ActiveRecord::Migration[7.0]
  def change
    # add_reference :places, :user, foreign_key: {to_table: :users}
  end
end
