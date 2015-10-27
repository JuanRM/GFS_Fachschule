class AddFieldsFromPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :num, :integer
  end
end
