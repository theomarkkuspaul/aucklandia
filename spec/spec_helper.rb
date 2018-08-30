require "bundler/setup"
require "aucklandia"
require "vcr"
require "webmock"
require "pry"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes/"
  config.hook_into :webmock
  config.configure_rspec_metadata!

  # prevent sensitive data creeping in
  config.filter_sensitive_data('<SECRET>') do |interaction|
  	ENV['AUCKLANDIA_SECRET']
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
