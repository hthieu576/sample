# frozen_string_literal: true

class Api::V1::ApidocsController < ApplicationController
  include Swagger::Blocks
  layout false

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Sample Account Documentation'
      key :description, 'Sample Account - API version 1'
    end
    key :basePath, '/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CONTROLLERS = [
    Api::V1::UsersController,
    Api::V1::AccountsController,
  ].freeze

  SWAGGERED_MODELS = [
    self,
  ].freeze

  def index
    @json = Swagger::Blocks.build_root_json(SWAGGERED_CONTROLLERS + SWAGGERED_MODELS).to_json.html_safe
  end
end
