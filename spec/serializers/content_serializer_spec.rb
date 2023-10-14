# frozen_string_literal: true

describe ContentSerializer, type: :serializer do
  subject(:serializer) { described_class.new(content).serializable_hash }

  describe '#serializable_hash' do
    let(:user) { create(:user) }
    let(:content) { create(:content, profile: user.profile) }

    let(:expected_serialization) do
      {
        id: content.id,
        title: 'Same title',
        description: 'Same description'
      }
    end

    it { expect(serializer).to eq(expected_serialization) }
  end
end
