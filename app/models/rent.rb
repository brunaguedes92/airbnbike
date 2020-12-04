class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :user, :bike, :status, :start_date, :end_date, presence: true
end
