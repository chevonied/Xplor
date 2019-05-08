class AddAttachmentImageToSubleases < ActiveRecord::Migration
  def self.up
    change_table :subleases do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :subleases, :image
  end
end
