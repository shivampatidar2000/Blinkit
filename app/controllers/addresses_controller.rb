class AddressesController < ApplicationController
  before_action :authenticate_user!

  def new
    @address = Address.new
  end
  def create
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save
      redirect_to items_path, notice: "Address created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @addresses = current_user.addresses
  end

  private

  def address_params
    params.require(:address).permit(:user_id, :city, :state, :street, :country, :pincode)
  end
end
