class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :user, :bike, :start_date, :end_date, presence: true
  # validates_uniqueness_of :bike, conditions: -> { where.not(status: 'leased') }
end
