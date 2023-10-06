class TestResult < ApplicationRecord
  belongs_to :sample

  validates :result, presence: true
  validates :sample, presence: true
 
  after_create :complete_sample

  private
  
  def complete_sample
    self.sample.update(status: 'completed')
  end
end