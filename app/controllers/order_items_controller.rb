class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    if valid_cart_total?(order_item_params)
      @order_item = find_cart_item_by_id(cart.id, order_item_params[:album_id].to_i)
      # @order_item =
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
      end
    else
      redirect_to albums_path
    end
  end

  def update
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(quantity: order_item_params[:quantity].to_i)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @order = Order.find(params[:order_id])
    order_item = @order.order_items.find(params[:id])
    @order_id = order_item.id
    order_item.destroy
    respond_to do |format|
      format.js
    end

  end
  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :album_id)
  end
end
