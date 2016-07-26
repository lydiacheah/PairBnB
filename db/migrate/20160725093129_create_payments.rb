class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer :user_id, index: true
    	t.integer :reservation_id, index: true
    	t.integer :ref_no
    	t.integer :last_four

    	t.boolean :success
    	
      t.timestamps null: false
    end
  end
end
