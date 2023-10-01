class Patient < ApplicationRecord

  has_many :samples
accepts_nested_attributes_for :samples
  validates :name, presence: true, length: { maximum: 255 }
  validates :dob, presence: true


end
