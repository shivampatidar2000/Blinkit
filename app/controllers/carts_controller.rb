class CartsController < ApplicationController
  before_action :authenticate_user!


  def show
    @cart = current_user.cart || current_user.create_cart
  end

  def add_item
    cart = current_user.cart || current_user.create_cart
    cart.cart_items.create(item_id: params[:item_id], quantity: 1)
    Order.create(user: current_user, address: current_user.addresses.last, item_id: params[:item_id], status: "placed")
    redirect_to cart_path
  end
end
