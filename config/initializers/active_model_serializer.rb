# frozen_string_literal: true

ActiveModel::Serializer.configure do |config|
  config.adapter = :json_api
  config.key_transform = :unaltered
  config.default_includes = ''
end
