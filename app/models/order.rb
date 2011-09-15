class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  include TotalCalculator
  
  def self.create_from_cart(order_attributes, user)
    order = nil
    Order.transaction do
      order = user.orders.create!(order_attributes)
      order.line_items << user.cart.line_items
      user.cart.destroy
    end
    order
  end
end
