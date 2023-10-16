# frozen_string_literal: true

describe Contents::Update, type: :service do
  subject(:result) { described_class.new(params).updater }

  let(:user) { create(:user) }
  let(:content) { create(:content, profile: user.profile) }
  let(:params) do
    {
      title: 'New title',
      description: 'New description',
      id: content.id
    }
  end

  describe '#updater' do
    context 'when update is successfull' do
      it 'verify returns' do
        expect(result).to eq(true)
        expect { content.reload }.to change {
                                       [content.title, content.description]
                                     }.to(['New title', 'New description'])
      end
    end

    context 'when update is failure' do
      context 'when id does not exists' do
        let(:content) { OpenStruct.new(id: 1) }

        it 'verify returns' do
          expect { result }.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Content with 'id'=1")
          expect { content.reload }.not_to(change { [content.title, content.description] })
        end
      end
    end
  end
end
