class TestResultMailer < ApplicationMailer
  def send_results(test_result)
    @test_result = test_result
    mail(to: @test_result.sample.patient.patient_email, subject: 'Your Test Results')
  end
end
