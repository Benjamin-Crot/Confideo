class Availability < ApplicationRecord
  belongs_to :profile

  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :from_time, presence: true
  validates :to_time, presence: true
  validates :slot_time, presence: true

end
