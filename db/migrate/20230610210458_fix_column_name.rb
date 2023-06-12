class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :matches, :guider, :guider_id
    rename_column :matches, :user, :user_id
  end
end
