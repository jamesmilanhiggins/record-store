class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :cart

  def cart
    current_user.account.orders.where("status = 'Active'").first
  end
end
