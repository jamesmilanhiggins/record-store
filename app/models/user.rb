class User < ApplicationRecord
  has_one :account
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 after_save :add_account

 def add_account
   Account.create(user_id: self.id)
 end
end
