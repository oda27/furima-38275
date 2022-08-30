class BuysController < ApplicationController

  before_action :authenticate_user!, only: :index 

  def index
    @item = Item.find(params[:item_id]) 
    if @item.buy.present?
      redirect_to root_path
    end
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id]) 
    @buy = Buyform.new(buy_params)
    if @buy.valid?
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def buy_params
    params.permit(:post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
