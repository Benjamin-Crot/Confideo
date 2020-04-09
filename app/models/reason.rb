class Reason < ApplicationRecord
  belongs_to :profile

  validates :name, presence: true
  validates :price, presence: true
end
