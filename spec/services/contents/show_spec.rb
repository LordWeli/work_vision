# frozen_string_literal: true

describe Contents::Show, type: :service do
  subject(:result) { described_class.new(params).viewer }

  describe '#viewer' do
    let(:params) { content.id }

    context 'when create is successfull' do
      let(:user) { create(:user) }
      let(:content) { create(:content, profile: user.profile) }

      it 'verify creation return' do
        expect(result).to be_a(Content)
        expect(result).to eq(content)
      end
    end

    context 'when create is failure' do
      context 'when user_id does not exists' do
        let(:content) { OpenStruct.new(id: 1) }

        it 'verify returns of request' do
          expect { result }.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Content with 'id'=1")
          expect(Content.count).to eq(0)
        end
      end
    end
  end
end
