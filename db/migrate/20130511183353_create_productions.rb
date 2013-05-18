class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.references :product_type
      t.references :lot
      t.boolean :is_electronic
      t.integer :quantity
      t.references :measure
      t.decimal :price
      t.integer :order_number

      t.timestamps
    end
    add_index :productions, :product_type_id
    add_index :productions, :measure_id
    add_index :productions, :lot_id
  end
end
