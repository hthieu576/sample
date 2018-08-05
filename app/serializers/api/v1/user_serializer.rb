# frozen_string_literal: true

class Api::V1::UserSerializer < ActiveModel::Serializer
  has_many :accounts, serializer: Api::V1::AccountSerializer
end
