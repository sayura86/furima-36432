class PurchaseInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_items
  def index
    @address = Address.new
    redirect_to root_path if @item.purchase_info.present? || (@item.user.id == current_user.id)
  end

  def create
    @address = Address.new(purchase_params)
    if @address.valid?
      pay_item
      @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:address).permit(:postal_code, :ship_from_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_items
    @item = Item.find(params[:item_id])
  end
end
