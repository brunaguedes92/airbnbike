class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  has_one :rent
  monetize :amount_cents

  validates :state, :user, :bike, presence: true
end
