RSpec.describe Address, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
