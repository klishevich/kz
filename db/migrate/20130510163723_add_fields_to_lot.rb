class AddFieldsToLot < ActiveRecord::Migration
  def change
    add_column :lots, :order_number, :integer
    add_column :lots, :tz_file, :string
    add_column :lots, :initial_price_reasoning_file, :string
    add_column :lots, :other_documents_file, :string
    add_column :lots, :initial_price_description, :text
    add_column :lots, :participant_demands, :text
    add_column :lots, :subcontractor_demands, :text
    add_column :lots, :application_pledge, :boolean
    add_column :lots, :application_pledge_percent, :decimal
    add_column :lots, :application_pledge_sum, :decimal
    add_column :lots, :application_pledge_form, :text
    add_column :lots, :contract_pledge, :boolean
    add_column :lots, :contract_pledge_percent, :decimal
    add_column :lots, :contract_pledge_sum, :decimal
    add_column :lots, :contract_pledge_form, :text
  end
end
