class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :adress, :string
    add_column :users, :language, :string
    add_column :users, :city, :string
    add_column :users, :age, :integer
    add_column :users, :occupation, :string
    add_column :users, :interests, :string
    add_column :users, :about, :string
    add_column :users, :classification, :integer
    add_column :users, :visited_places, :string
    add_column :users, :host, :boolean
    add_column :users, :visitor, :boolean
  end
end
