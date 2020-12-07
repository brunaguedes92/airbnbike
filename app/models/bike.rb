class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :orders
  has_many :rents, through: :orders
  geocoded_by :address
  monetize :price_cents

  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, :description, :title, :price, presence: true
end
