class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destory]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  
  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :price, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end
  
end
