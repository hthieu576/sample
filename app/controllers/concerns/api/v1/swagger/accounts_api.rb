# frozen_string_literal: true

module Api::V1::Swagger::AccountsApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/accounts/{id}' do
      operation :get do
        key :tags, ['account']
        key :description, 'return a single account information'
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of account to fetch'
          key :required, true
        end
        response 200 do
          key :description, 'account response'
          schema do
            key :'$ref', :Account
          end
        end

        response 404 do
          key :description, '{ message: "Not Found" }'
        end
      end
    end

    swagger_path '/users/{user_id}/accounts' do
      operation :get do
        key :tags, ['accounts']
        key :description, 'return accounts based on user'
        parameter do
          key :name, :user_id
          key :in, :path
          key :description, 'ID of user to fetch'
          key :required, true
        end
        response 200 do
          key :description, 'accounts response'
          schema do
            key :'$ref', :Account
          end
        end

        response 404 do
          key :description, '{ message: "Not Found" }'
        end
      end
    end
  end
end
