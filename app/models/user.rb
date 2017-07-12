class User < ApplicationRecord
  belongs_to :account, foreign_key: :account_id, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
