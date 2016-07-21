class AddNameColumnToListingsTable < ActiveRecord::Migration
  def change
  	add_column :listings, :name, :string, limit: 140
  end
end
