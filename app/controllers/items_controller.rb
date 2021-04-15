class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destory]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index

  end
end
