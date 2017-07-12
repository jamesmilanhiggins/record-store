class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.create(order_item_params)
    if @order_item.save
      flash[:notice] = "#{@order_item.quantity} x #{@order_item.album.title} added successfully."
      respond_to do |format|
        format.html { redirect_to account_order_path(current_user.account, cart)}
        format.js
      end
    else
      flash[:alert] = "Error when adding album."
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
