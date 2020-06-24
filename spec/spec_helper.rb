# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'factory_bot'
require 'shoulda/matchers'

ActiveRecord::Migration.check_pending!

Capybara.register_driver :headless_chrome do |app|
  options = %w[headless disable-gpu window-size=1366,768]
  options += ['enable-features=NetworkService,NetworkServiceInProcess']
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: options, w3c: false })
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :headless_chrome
Capybara.default_host = 'http://www.example.com'
Capybara.default_max_wait_time = 4
Capybara.ignore_hidden_elements = false
Capybara.save_path = Rails.root.join('tmp')

support_files = Dir[Rails.root.join('spec/support/**/*.rb')].sort
support_files.each { |file| require file }

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.include FactoryBot::Syntax::Methods

  config.order = 'random'
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.expect_with :rspec do |conf|
    conf.syntax = :expect
  end

  config.before(:each) do |_example|
    Bullet.start_request if Bullet.enable?
  end

  config.before(:all) do
    I18n.locale = :en
  end

  if Bullet.enable?
    config.after :each, type: :feature do
      Bullet.perform_out_of_channel_notifications if Bullet.notification?
      Bullet.end_request
    end
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
