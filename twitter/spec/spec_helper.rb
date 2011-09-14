require 'torquespec'

TorqueSpec.local {
  require 'capybara/dsl'
  require 'akephalos'

  Capybara.register_driver :akephalos do |app|
    Capybara::Driver::Akephalos.new(app, :browser => :firefox_3, :resynchronize=>false, :validate_scripts=>false)
  end

  Capybara.default_driver = :akephalos
  Capybara.app_host = "http://localhost:8080"
  Capybara.run_server = false

  RSpec.configure do |config|
    config.include Capybara
    config.after do
      Capybara.reset_sessions!
    end
  end
}

# Because DRb requires ObjectSpace and 1.9 disables it
require 'jruby'
JRuby.objectspace = true
