# frozen_string_literal: true

require 'active_support/concern'

module JsonHelper
  extend ActiveSupport::Concern

  def json_response
    JSON(response.body)
  end
end

RSpec.configure { |config| config.include JsonHelper, type: :request }
