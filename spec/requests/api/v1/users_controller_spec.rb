# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'GET /v1/users/:id' do
    let(:user) { create(:user, :with_account) }
    subject { get api_v1_user_path(user.id) }

    context 'with case successful' do
      it 'http status' do
        subject
        expect(response.status).to eq 200
      end

      it 'result' do
        subject
        expect(json_response['attributes']['id']).to eq user.id
      end
    end

    context 'with case failed' do
      subject { get api_v1_user_path(123_456) }
      it 'http status' do
        subject
        expect(response.status).to eq 404
      end

      it 'result' do
        subject
        expect(json_response['message']).to eq 'Not Found'
      end
    end
  end
end
