class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    #@item = Item.all
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

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :delivery_fee_id, :ship_from_id,
                                 :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
