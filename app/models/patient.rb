class Patient < ApplicationRecord

  has_many :samples
accepts_nested_attributes_for :samples
validates :name, presence: true
validates :dob, presence: true



end
