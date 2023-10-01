require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/jobs/'
  add_filter '/mailers/'
  add_filter '/spec/'
end
