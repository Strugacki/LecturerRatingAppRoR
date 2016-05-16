class AddUserIdToLecturers < ActiveRecord::Migration
  def change
    add_column :lecturers, :user_id, :integer
  end
end
