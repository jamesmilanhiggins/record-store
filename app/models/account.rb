class Account < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, optional: true
  has_many :orders, dependent: :destroy
  after_create :add_initial_order

  def add_initial_order
    self.orders.create!
  end
end
