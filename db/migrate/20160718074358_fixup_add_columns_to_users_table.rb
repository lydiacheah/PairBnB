require_relative '20160718071623_add_columns_to_users_table'

class FixupAddColumnsToUsersTable < ActiveRecord::Migration
  def change
  	revert AddColumnsToUsersTable

  	add_column :users, :birthday, :date
  	add_column :users, :name, :string
  	add_column :users, :image, :string
  	add_column :users, :gender, :string

  end
end
