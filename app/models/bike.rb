class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :rents

  validates :address, :description, :title, :price, presence: true
end
