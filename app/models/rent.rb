class Rent < ApplicationRecord
  belongs_to :order
  has_one :user, through: :order
  has_one :bike, through: :order

  validates :order, :state, presence: true
end
