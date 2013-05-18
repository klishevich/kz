class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.integer :code
      t.string :name
      t.string :short_name

      t.timestamps
    end
  end
end
