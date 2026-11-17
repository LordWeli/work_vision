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
    it { should have_secure_password }
  end

  describe 'password storage' do
    let(:user) { create(:user, password: 'secret123', password_confirmation: 'secret123') }

    it 'stores only the BCrypt digest' do
      expect(user.password_digest).to be_present
      expect(user.password_digest).not_to eq('secret123')
      expect(User.column_names).not_to include('password', 'confirm_password')
    end

    it 'authenticates with the correct password only' do
      expect(user.authenticate('secret123')).to eq(user)
      expect(user.authenticate('wrong')).to be(false)
    end

    it 'requires confirmation on create' do
      expect(build(:user, password_confirmation: nil)).not_to be_valid
    end

    it 'rejects mismatched confirmation' do
      expect(build(:user, password: 'a1b2c3', password_confirmation: 'other')).not_to be_valid
    end
  end

  describe 'callbacks' do

    it 'calls add_profile after create' do
      expect { create(:user) }.to change { Profile.count }.by(1)
    end
  end
end
