class Order < ApplicationRecord
  has_many :order_items
  belongs_to :account

  validates :total_price, :status, presence: true
end
