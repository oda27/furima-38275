class ItemsController < ApplicationController

  before_action :authenticate_user!,except: :index

  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id) 
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :condition_id, :send_price_id, :send_day_id, :prefecture_id ).merge(user_id: current_user.id)
  end
end
