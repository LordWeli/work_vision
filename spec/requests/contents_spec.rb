# frozen_string_literal: true

describe ContentsController, type: :request do
  describe '#show' do
    let(:user) { create(:user) }
    let(:content) { create(:content, profile: user.profile) }

    before { get "/users/#{user.id}/contents/#{content.id}" }

    context 'when request is successfull' do
      let(:expect_result) { ContentSerializer.new(content).to_json }

      it 'verify returns of request' do
        expect(response).to have_http_status(200)
        expect(response.body).to eq(expect_result)
      end
    end
  end

  describe '#create' do
    let(:user) { create(:user) }
    let(:params) do
      {
        title: 'Same title',
        description: 'Same description'
      }
    end

    before { post "/users/#{user.id}/contents", params: params }

    context 'when request is successfull' do
      it 'verify returns of request' do
        expect(response).to have_http_status(200)
        expect(user.profile.contents.size).to eq(1)
      end
    end

    context 'when request is failure' do
      context 'when user_id does not exists' do
        let(:user) { OpenStruct.new(id: 1) }

        it 'verify returns of request' do
          expect(response).to have_http_status(500)
          expect(Content.count).to eq(0)
        end
      end
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    let(:content) { create(:content, profile: user.profile) }
    let(:params) do
      {
        title: 'New title',
        description: 'New description'
      }
    end

    before { patch "/users/#{user.id}/contents/#{content.id}", params: params }

    context 'when request is successfull' do
      it 'verify returns of request' do
        expect(response).to have_http_status(200)
        expect(response.body).to eq('true')
      end
    end

    context 'when request is failure' do
      context 'when content_id does not exists' do
        let(:content) { OpenStruct.new(id: 1) }

        it 'verify returns of request' do
          expect(response).to have_http_status(404)
        end
      end
    end
  end
end
