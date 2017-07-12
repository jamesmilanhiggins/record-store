class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    @order_item = cart.order_items.new
  end
end
