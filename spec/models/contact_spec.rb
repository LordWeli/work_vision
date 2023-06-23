RSpec.describe Contact, type: :model do
  describe 'associations' do
    it { should belong_to(:profile) }
  end
end
