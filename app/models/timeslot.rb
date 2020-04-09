class Timeslot < ApplicationRecord
  belongs_to :profile
  belongs_to :reason, optional: true
  belongs_to :user, optional: true

  validates :date, presence: true
  validates :from_time, presence: true
  validates :to_time, presence: true

end
