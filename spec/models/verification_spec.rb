RSpec.describe Verification, type: :model do
  describe 'associations' do
    it { should belong_to(:profile) }
    it { should have_one_attached(:image) }
  end
end
