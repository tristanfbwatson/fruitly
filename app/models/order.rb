class Order < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :city, :email, :name, :postcode, :stripe_card_token, :stripe_customer_token

  has_many :order_products
  has_many :products, through: :order_products

  validates :name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :postcode, presence: true


end
