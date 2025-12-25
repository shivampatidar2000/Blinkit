class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    if current_user.rider?
      @orders = Order.where(status: "placed")
    else
      @orders = current_user.orders
    end
  end

  def deliver
    order = Order.find(params[:id])
    order.update(status: "delivered", rider: current_user)
    redirect_to orders_path
  end
end
