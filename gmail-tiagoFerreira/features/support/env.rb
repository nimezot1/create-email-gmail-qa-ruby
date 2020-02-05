require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "report_builder"
require "faker"
require "pdf-reader"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome #_headless
  config.default_max_wait_time = 4
end

