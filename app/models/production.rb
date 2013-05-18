class Production < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :measure
  belongs_to :lot
  attr_accessible :is_electronic, :price, :quantity, :product_type_id,
                  :measure_id, :order_number
end
