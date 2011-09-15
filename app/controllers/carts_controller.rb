class CartsController < ApplicationController
  before_filter :verify_authentication
  
  def create
    current_user.cart ||= Cart.create
    @cart = current_user.cart
    if line_item = @cart.line_items.where(:product_id => params[:product_id]).first
      line_item.increment!(:count)
    else
      @cart.line_items.create!(:product_id => params[:product_id], :count => 1)
    end
    
    unless request.xhr?
      redirect_to root_url, :notice => "Product Added to Cart"
    end
  end

  def show
    @cart = current_user.cart
    redirect_to root_url, :notice => "No Products in Cart" if @cart.line_items.empty?
  end

  def update
    @cart = current_user.cart
    if @cart.update_attributes(params[:cart])
      unless request.xhr?
        redirect_to @cart, :notice => "Cart Updated"
      end
    end
  end

end
