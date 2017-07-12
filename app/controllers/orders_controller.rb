class OrdersController < ApplicationController
  def show
    @account = Account.find(params[:account_id])
    @order = Order.find(params[:id])
  end

end
