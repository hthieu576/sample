# frozen_string_literal: true

class Api::V1::AccountSerializer < ActiveModel::Serializer
  belongs_to :user, serializer: Api::V1::UserSerializer
end
