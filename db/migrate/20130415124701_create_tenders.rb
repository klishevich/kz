class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.string :name
      t.integer :registry_number
      t.date :placing_date
      t.date :start_app_date
      t.date :end_app_date
      t.string :app_place
      t.string :app_order
      t.date :app_open_date
      t.string :app_open_place
      t.date :app_view_date
      t.string :app_view_place
      t.date :doc_begin_date
      t.date :doc_end_date
      t.string :doc_place
      t.string :doc_order

      t.timestamps
    end
  end
end
