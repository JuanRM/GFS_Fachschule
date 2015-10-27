class RemoveFieldsFromContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :tel2, :string
  end
end
