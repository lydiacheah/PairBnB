class RemoveProfilePictureColumnFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :profile_picture
  end
end
