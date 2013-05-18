class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name
      t.float :start_price
      t.date :contract_delivery_date
      t.references :tender

      t.timestamps
    end
    add_index :lots, :tender_id
  end
end
