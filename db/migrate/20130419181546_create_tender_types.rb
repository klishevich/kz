class CreateTenderTypes < ActiveRecord::Migration
  def change
    create_table :tender_types do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end
