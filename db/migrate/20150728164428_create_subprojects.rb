class CreateSubprojects < ActiveRecord::Migration
  def change
    create_table :subprojects do |t|
      t.integer :project_id
      t.string :title1
      t.string :title2
      t.text :text

      t.timestamps null: false
    end
  end
end
