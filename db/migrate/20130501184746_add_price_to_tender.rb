class AddPriceToTender < ActiveRecord::Migration
  def change
    add_column :tenders, :price, :float
  end
end
