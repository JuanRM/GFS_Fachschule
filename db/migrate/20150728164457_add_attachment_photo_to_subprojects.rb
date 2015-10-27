class AddAttachmentPhotoToSubprojects < ActiveRecord::Migration
  def self.up
    change_table :subprojects do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :subprojects, :photo
  end
end
