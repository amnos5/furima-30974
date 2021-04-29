class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order = UserOrder.new
    if @item.user_id == current_user.id || @item.order!= nil
      return redirect_to root_path
    end
  end
  
  def create
    @order = UserOrder.new(order_params)
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
    params.require(:user_order).permit(:card_token, :postal_code, :prefectures, :city, :house_number, 
                  :build_number, :phone_number).merge(user_id: current_user.id, item_id:params[:item_id], card_token: params[:card_token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:card_token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end