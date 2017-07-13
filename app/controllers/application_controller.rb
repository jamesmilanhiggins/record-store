class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :cart
  helper_method :update_item_stock
  helper_method :cart_total_price
  helper_method :cart_count
  helper_method :find_cart_item_by_id
  helper_method :valid_cart_total?
  helper_method :cart_quantity

  def cart
    current_user.account.orders.where("status = 'Active'").first if current_user
  end

  def update_item_stock(order)
    order.order_items.each do |item|
      item.album.update(quantity: item.album.quantity - item.quantity)
    end
  end

  def cart_total_price
    total = cart.order_items.sum { |item| item.quantity * item.album.price }
    total > 0 ? total : 0.00
  end

  def cart_count
    cart.order_items.sum do |item|
      item.quantity
    end
  end

  def find_cart_item_by_id(cart_id, order_item_id)
    cart = Order.find(cart_id)
    cart.order_items.find {|item| item.album_id == order_item_id }
  end

  def valid_cart_total?(new_order)
    item_in_cart = find_cart_item_by_id(cart.id, new_order[:album_id].to_i)
    if item_in_cart
      requested_stock = item_in_cart.quantity + new_order[:quantity].to_i
    else
      requested_stock = new_order[:quantity].to_i
    end
    album = Album.find(new_order[:album_id].to_i)
    album.quantity >= requested_stock
  end

  def cart_quantity(cart, album_id)
    item = cart.order_items.find{ |item| item.album_id == album_id }
    if item
      item.quantity
    else
      0
    end
  end
end
