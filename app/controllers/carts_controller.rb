class CartsController < ApplicationController
  before_filter :logged_in?
  
  def create
    current_user.cart ||= Cart.create
    current_user.cart.line_items.create!(:product_id => params[:product_id], :count => 1)
    redirect_to root_url, :notice => "Product Added to Cart"
  end

  def show
    @cart = current_user.cart
  end

  def update
    @cart = current_user.cart
    if @cart.update_attributes(params[:cart])
      redirect_to @cart, :notice => "Cart Updated"
    end
  end

end
