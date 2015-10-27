class AddFieldsFromContact < ActiveRecord::Migration
  def change
    add_column :contacts, :cp, :string
    add_column :contacts, :city, :string
  end
end
