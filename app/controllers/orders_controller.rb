class OrdersController < ApplicationController
  before_filter :verify_authentication
  before_filter :verify_cart, :except => :show
  
  def new
    @order = current_user.orders.build
    @order.line_items << current_user.cart.line_items
  end

  def create
    if @order = Order.create_from_cart(params[:order], current_user)
      redirect_to @order, :notice => "Order successfully placed."
    else
      redirect_to current_user.cart, :alert => "Order creation failed."
    end
  end

  def show
    @order = Order.find(params[:id])
  end
  
  protected
  def verify_cart
    unless current_user.cart.present? && current_user.cart.line_items.present?
      redirect_to root_url, :alert => "You need to have products in cart."
    end
  end
end
