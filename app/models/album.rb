class Album < ApplicationRecord
    has_many :songs
    has_many :order_items
    has_and_belongs_to_many :accounts

    validates :title, :artist, :price, :genre, :quantity, presence: true
    validates :price, :quantity, numericality: true
    validates :sale_percentage, numericality: {
      less_than: 101,
      greater_than: 0
    }
end
