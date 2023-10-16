# frozen_string_literal: true

describe BaseSerializer, type: :serializer do
  describe '#many_items' do
    subject(:result) { ContentSerializer.new(object).many_items(object.contents, object.serializer) }

    let(:user)     { create(:user) }
    let(:contents) { build_list(:content, 2, profile: user.profile) }
    let(:object)   { OpenStruct.new(contents: contents, serializer: ContentSerializer) }

    it 'verify result' do
      objects = result.map{|item| item.object}

      expect(result).to be_a(Array)
      expect(objects).to eq(contents)
    end
  end
end
