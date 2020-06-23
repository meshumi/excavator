# frozen_string_literal: true

class ErrorSerializer
  attr_reader :models, :errors

  def initialize(models)
    @models = models
    @errors = []
  end

  def as_json
    models.each do |model|
      errors << model_errors(model)
    end
    { errors: errors.flatten }
  end

  private

  def model_errors(model)
    model.errors.messages.map do |field, errors|
      errors.map do |error_message|
        {
          source: { pointer: "/data/attributes/#{model.model_name.plural}/#{field}" },
          detail: error_message
        }
      end
    end
  end
end
