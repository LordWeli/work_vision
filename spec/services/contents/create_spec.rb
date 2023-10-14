# frozen_string_literal: true

describe Contents::Create, type: :service do
  subject(:result) { described_class.new(params).creator }

  let(:user) { create(:user) }
  let(:params) do
    {
      title: 'Same title',
      description: 'Same description',
      user_id: user.id
    }
  end

  describe '#creator' do
    context 'when create is successfull' do
      it 'verify creation return' do
        expect(result).to be_a(Content)
        expect(user.profile.contents.size).to eq(1)
      end
    end

    context 'when create is failure' do
      context 'when user_id does not exists' do
        let(:user) { OpenStruct.new(id: 1) }

        it 'verify returns of request' do
          expect { result }.to raise_error(NoMethodError, "undefined method `id' for nil:NilClass")
          expect(Content.count).to eq(0)
        end
      end
    end
  end
end
