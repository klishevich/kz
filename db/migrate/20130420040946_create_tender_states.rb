class CreateTenderStates < ActiveRecord::Migration
  def change
    create_table :tender_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
