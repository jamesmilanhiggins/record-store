class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :cart
  helper_method :update_item_stock
  helper_method :cart_total_price

  def cart
    current_user.account.orders.where("status = 'Active'").first if current_user
  end

  def update_item_stock(order)
    order.order_items.each do |item|
      item.album.update(quantity: item.album.quantity - item.quantity)
    end
  end

  def cart_total_price
    cart.order_items.sum do |item|
      item.quantity * item.album.price
    end
  end
end
