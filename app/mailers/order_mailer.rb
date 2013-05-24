class OrderMailer < ActionMailer::Base
  default from: "tristan.watson@gmail.com"

  add_template_helper ApplicationHelper

  def customer(order)
    @order = order

    mail to: @order.email, subject: "New order from Fruitly"
  end

  def admin(order)
    @order = order

    mail to: "tristan.watson@gmail.com", subject: "New customer order"
  end
end
