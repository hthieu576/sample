# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'GET /v1/users/:user_id/accounts' do
    subject { get api_v1_user_accounts_path(user_id: user.id) }

    let(:user) { create(:user, :with_account) }

    context 'with case successful' do
      it 'http status' do
        subject
        expect(response.status).to eq 200
      end

      it 'result' do
        subject
        expect(json_response['attributes']).to_not be_nil
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

  describe 'GET /v1/accounts/:id' do
    subject { get api_v1_account_path(account.id) }

    let(:account) { create(:account) }

    context 'with case successful' do
      it 'http status' do
        subject
        expect(response.status).to eq 200
      end

      it 'result' do
        subject
        expect(json_response['attributes']['id']).to eq account.id
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
