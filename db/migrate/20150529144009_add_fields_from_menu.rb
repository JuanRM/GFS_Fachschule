class AddFieldsFromMenu < ActiveRecord::Migration
  def change
    add_column :menus, :submenu_id, :integer
    add_column :menus, :title, :string
    add_column :menus, :content, :text
    add_column :menus, :Picture_fiel_name, :string
    add_column :menus, :Picture_content_type, :string
    add_column :menus, :Picture_file_size, :integer
    add_column :menus, :Picture_updated_at, :datetime
  end
end
