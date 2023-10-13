# frozen_string_literal: true

describe "Contents", type: :request do
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
end
