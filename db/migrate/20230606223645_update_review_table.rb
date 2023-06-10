class UpdateReviewTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :image, index: true, foreign_key: true
    remove_column :trips, :review
    add_reference :reviews, :trip, foreign_key: true
    add_column :trips, :legend, :string
  end
end
