class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

    	t.integer :user_id, index: true, foreign_key: true
    	t.string :address
    	t.string :city
    	t.string :country
    	t.string :property_type
    	t.integer :people_number
    	t.integer :bathroom_number
    	t.integer :bedroom_number

      t.timestamps null: false
    end
  end
end
