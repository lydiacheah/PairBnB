class RenameImageColumnInUsersTable < ActiveRecord::Migration
  def change
  	rename_column :users, :image, :profile_picture
  end
end
