class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.find {|item| item.album_id == order_item_params[:album_id].to_i }
    # if order_item of selected album_id already exists
    # add requested quantity to that order_item
    # otherwise, the album is not in the cart
    # so add it to the cart, with the requested quantity
    if @order_item
      @order_item.update(quantity: @order_item.quantity + order_item_params[:quantity].to_i)
    else
      @order_item = @order.order_items.create(order_item_params)
    end
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
