class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :seller_only, except: :index


  def index
    @items = Item.all
  end


  def new
    @item = Item.new
  end


  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def seller_only
    redirect_to root_path unless current_user.seller?
  end


  def item_params
    params.require(:item).permit(:name, :price, :quantity)
  end
end
