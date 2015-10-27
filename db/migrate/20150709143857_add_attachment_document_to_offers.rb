class AddAttachmentDocumentToOffers < ActiveRecord::Migration
  def self.up
    change_table :offers do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :offers, :document
  end
end
