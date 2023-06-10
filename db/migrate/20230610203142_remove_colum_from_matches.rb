class RemoveColumFromMatches < ActiveRecord::Migration[7.0]
  def change
    remove_column :matches, :user_id_id, :foreign_key
    remove_column :matches, :guider_id_id, :foreign_key
  end
end
