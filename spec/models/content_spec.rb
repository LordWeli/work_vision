RSpec.describe Content, type: :model do
  describe 'associations' do
    it { should belong_to(:profile) }
    it { should have_many_attached(:images) }
  end
end
