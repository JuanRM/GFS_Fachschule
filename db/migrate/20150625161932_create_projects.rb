class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title1
      t.string :title2
      t.text :content

      t.timestamps null: false
    end
  end
end
