class ChangeDataTypes < ActiveRecord::Migration
  def change
    change_column :tenders, :price, :decimal
    change_column :lots, :start_price, :decimal
  end
end
