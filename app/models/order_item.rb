class OrderItem < ApplicationRecord
  belongs_to :album
  belongs_to :order

  validates :quantity, presence: true, numericality: true
end
