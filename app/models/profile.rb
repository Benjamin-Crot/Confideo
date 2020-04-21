class Profile < ApplicationRecord
  belongs_to :user
  has_many :availabilities, dependent: :destroy
  has_many :reasons, dependent: :destroy
  has_many :timeslots, dependent: :destroy

  validates :profession, presence: true
  validates :description, presence: true

end

