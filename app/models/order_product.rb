class OrderProduct < ActiveRecord::Base
  attr_accessible :order_id, :price_in_pence, :product_id, :quantity

  belongs_to :order
  belongs_to :product

  delegate :title, :description, :image, to: :product
  
end
