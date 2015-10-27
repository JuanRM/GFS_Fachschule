class AddFieldsFromPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :num, :integer
    add_column :pictures, :subproject_id, :integer
  end
end
