Apipie.configure do |config|
  config.app_name                = "TestExcavator"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/api/doc"
  config.default_version         = "v1"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
  config.languages = ['en']
  config.default_locale = 'en'
end
