class LabSection < ApplicationRecord
  has_many :tests
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
end
