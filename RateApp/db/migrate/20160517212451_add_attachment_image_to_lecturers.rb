class AddAttachmentImageToLecturers < ActiveRecord::Migration
  def self.up
    change_table :lecturers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :lecturers, :image
  end
end
