class AddColumnsToTenders < ActiveRecord::Migration
  def change
  	change_table :tenders do |t|
  		t.references :tender_type
  		t.references :tender_state
  		t.references :customer
	end
	add_index :tenders, :tender_type_id 
	add_index :tenders, :tender_state_id 
	add_index :tenders, :customer_id 
  end
end
