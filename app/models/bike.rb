class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :rents
  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, :description, :title, :price, presence: true
end
