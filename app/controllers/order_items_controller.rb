class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.create(order_item_params)
    if @order_item.save
      # add dynamic alert message
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end
  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :album_id)
  end
end
