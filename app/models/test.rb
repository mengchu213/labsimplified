class Test < ApplicationRecord
  belongs_to :lab_section

  validates :name, presence: true, uniqueness: { scope: :lab_section_id }, length: { maximum: 255 }
  validates :lab_section, presence: true
end
