class AddColumForMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :user, :integer, null: false
    add_column :matches, :guider, :integer, null: false
  end
end
