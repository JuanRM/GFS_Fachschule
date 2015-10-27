class AddFieldsFromSubmenu < ActiveRecord::Migration
  def change
    add_column :submenus, :menu_id, :integer
  end
end
