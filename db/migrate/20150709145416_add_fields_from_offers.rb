class AddFieldsFromOffers < ActiveRecord::Migration
  def change
    add_column :offers, :principal_id, :integer
  end
end
