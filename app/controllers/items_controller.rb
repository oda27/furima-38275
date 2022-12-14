class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] 

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new
    end
  end

  def show 
  end 

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
    if @item.buy.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :condition_id, :send_price_id, :send_day_id, :prefecture_id ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id]) 
  end
end
