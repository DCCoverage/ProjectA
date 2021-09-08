require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  track_files 'lib/**/*.rb'
end

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
