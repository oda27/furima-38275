class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id]) 
    @buy = Buyform.new
  end

  def create
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
    params.require(:buyform).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: current_user.id)
  end

end
