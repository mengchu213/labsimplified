class Sample < ApplicationRecord
  belongs_to :test, optional: true
  belongs_to :patient
  has_one :test_result

  validates :sample_type, presence: true, length: { maximum: 255 }
  validates :status, presence: true, inclusion: { in: %w[pending processing completed] }
  validates :test, presence: true
  validates :patient, presence: true

  after_initialize :set_default_status, if: :new_record?
  
  def set_default_status
    self.status ||= 'pending'
  end
end
