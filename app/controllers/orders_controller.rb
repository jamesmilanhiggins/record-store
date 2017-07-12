class OrdersController < ApplicationController
  def show
    @account = Account.find(params[:account_id])
    @order = Order.find(params[:id])
  end

  def new
    update_item_stock(cart)
    cart.update(status: "Completed", total_price: cart_total_price)
    current_user.account.orders.create!
    redirect_to albums_path
  end
end
