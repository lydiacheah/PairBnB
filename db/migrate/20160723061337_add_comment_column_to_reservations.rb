class AddCommentColumnToReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :comment, :string
  end
end
