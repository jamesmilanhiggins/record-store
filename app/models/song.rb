class Song < ApplicationRecord
  belongs_to :album

  validates :name, :length, presence: true
end
