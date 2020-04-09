class Reason < ApplicationRecord
  belongs_to :profile
  has_many :timeslots
  validates :name, presence: true
  validates :price, presence: true
end
