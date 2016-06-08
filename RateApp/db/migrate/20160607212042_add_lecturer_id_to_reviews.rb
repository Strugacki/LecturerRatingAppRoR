class AddLecturerIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :lecturer_id, :integer
  end
end
