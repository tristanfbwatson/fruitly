class Product < ActiveRecord::Base
  attr_accessible :description, :previous_price_in_pence, :price_in_pence, :title, :image

  has_many :order_products
  has_many :orders, through: :order_products

  has_attached_file :image, styles: {
  	large: "500x500#",
  	medium: "300x300#",
  	thumb: "50x50#"
  }

  validates :title, presence: true
  validates :price_in_pence, presence: true, numericality: {
  	greater_than: 0
  }

end
