class Bike < ApplicationRecord
  belongs_to :user

  validates :address, :description, presence: true
end
