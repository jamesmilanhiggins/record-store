class Account < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, optional: true
  has_many :orders, dependent: :destroy
end
