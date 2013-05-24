class Order < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :city, :email, :name, :postcode, :stripe_card_token, :stripe_customer_token

  has_many :order_products
  has_many :products, through: :order_products

  validates :name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :postcode, presence: true

  def total_price

  	total = 0

  	order_products.each do |p|
  		total += p.price_in_pence
    end

  return total

  end

  def save_with_stripe

  if valid?

    @charge = Stripe::Charge.create(
      amount: total_price,
      currency: "gbp",
      card: stripe_card_token,
      description: email
      )

    save!
  end
rescue
  errors.add :base, "There was a problem with Stripe"
  end


end
