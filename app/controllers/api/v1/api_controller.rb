# frozen_string_literal: true

class Api::V1::ApiController < ApplicationController
  respond_to :json
  before_action :force_json_format
  protect_from_forgery with: :null_session, prepend: true

  def force_json_format
    request.format = :json
    params.permit![:format] = 'json'
  end
end
