class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = UserOrder.new
    if @item.user_id == current_user.id || @item.order!= nil
      return redirect_to root_path
    end
  end
  
  def create
    @order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :name, :price, :postal_code, :prefectures, :city, :house_number, :build_number, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
  end


end