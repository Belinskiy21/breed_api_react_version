require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Api::V1::DogsController do
  describe 'POST /api/v1/dogs/fetch' do
    subject { post fetch_api_v1_dogs_path, params: params }

    context 'when the params invalid' do
      let(:params) { nil }

      it 'responds with the status code 400' do
        subject
        expect(response).to have_http_status :bad_request
      end
    end

    context 'when params are valid' do
      let(:params) { { breedValue: 'husky' } }

      before do
        stub_request(:get, 'https://dog.ceo/api/breed/husky/images/random').
          with(
            headers: {
              'Accept' => '*/*',
              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent' => 'Ruby'
            }
          ).to_return(status: status, body: body, headers: {})
        subject
      end

      context 'when the breed found' do
        let(:body) { { message: 'img_url' }.to_json }
        let(:status) { 200 }

        it 'responds with the status code 200' do
          expect(response).to have_http_status :ok
        end

        it 'responds with the correct data in the body' do
          expect(response.body).to eq({ img: 'img_url', breed: 'Husky' }.to_json)
        end
      end

      context 'when the breed is not found' do
        let(:body) { { message: 'no matches' }.to_json }
        let(:status) { 404 }

        it 'responds with the status code 422' do
          expect(response).to have_http_status :unprocessable_entity
        end

        it 'responds with the correct data in the body' do
          expect(response.body).to eq({ message: I18n.t(:no_matches_found) }.to_json)
        end
      end
    end
  end
end
