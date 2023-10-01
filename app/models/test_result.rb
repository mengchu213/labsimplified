class TestResult < ApplicationRecord
  belongs_to :sample

  validates :result, presence: true
  validates :sample, presence: true
 


  
end