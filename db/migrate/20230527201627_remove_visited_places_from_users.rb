class RemoveVisitedPlacesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :visited_places
  end
end
