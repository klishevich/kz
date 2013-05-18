class AddFieldsToLots < ActiveRecord::Migration
  def change
    add_column :lots, :contract, :string
  end
end
