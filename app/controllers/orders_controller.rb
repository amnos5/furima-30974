class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
      @order = UserOrder.new
  end
  
  def create
  end


end
