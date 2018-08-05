# frozen_string_literal: true

module Api::V1::Swagger::UsersApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/users/{id}' do
      operation :get do
        key :tags, ['user']
        key :description, 'return a single user information'
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of user to fetch'
          key :required, true
        end
        response 200 do
          key :description, 'user response'
          schema do
            key :'$ref', :User
          end
        end

        response 404 do
          key :description, '{ message: "Not Found" }'
        end
      end
    end
  end
end
