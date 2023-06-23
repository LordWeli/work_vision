RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:profile) }
    it { should have_one(:address) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email).with_message('Invalid e-mail!') }
    it { should validate_presence_of(:password)}
  end

  describe 'callbacks' do
    it 'calls encrypt_password before create' do
      user = build(:user)
      expect(user).to receive(:encrypt_password)
      user.save
    end

    it 'calls add_profile after create' do
      expect { create(:user) }.to change { Profile.count }.by(1)
    end
  end
end
