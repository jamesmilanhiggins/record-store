class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    @order_item = cart.order_items.new
  end

  def show
    @album = Album.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
