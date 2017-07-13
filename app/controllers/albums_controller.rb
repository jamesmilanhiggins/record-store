class AlbumsController < ApplicationController
  def index
    @albums = Album.in_stock
    @order_item = cart.order_items.new if current_user
    if params[:query] && params[:query].gsub!(/[^a-z0-9 ]/i, "") != ""
      @query = params[:query]
      respond_to do |format|
        format.js
      end
    end
  end

  def show
    @album = Album.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
