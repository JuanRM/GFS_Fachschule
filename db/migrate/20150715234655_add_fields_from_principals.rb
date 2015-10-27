class AddFieldsFromPrincipals < ActiveRecord::Migration
  def change
    add_column :principals, :info, :text
  end
end
