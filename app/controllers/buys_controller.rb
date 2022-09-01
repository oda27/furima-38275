class BuysController < ApplicationController

  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index 

  def index
    @buy = Buyform.new
    if @item.buy.present?
      redirect_to root_path
    end
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @buy = Buyform.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def buy_params
    params.require(:buyform).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :price).merge(user_id: current_user.id, item_id: @item.id, token: params[:token] )
  end

  def set_item
    @item = Item.find(params[:item_id]) 
  end

  def pay_item
    # binding.pry
    Payjp.api_key = "sk_test_e66ba117173353dff4613c66"  
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  
      card: buy_params[:token],    
      currency: 'jpy'                 
    )
  end

end
