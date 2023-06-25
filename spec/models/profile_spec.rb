RSpec.describe Profile, type: :model do
  subject { build(:profile) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:hours) }
    it { should have_many(:contents) }
    it { should have_one(:service) }
    it { should have_one(:verification) }
    it { should have_one(:contact) }
    it { should have_one_attached(:avatar)}
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:document).case_insensitive }
    
    context 'when passing by document_validate' do
      let(:profile) { create(:profile, :skip_add_profile_callback_of_user) }

      it 'is valid document' do
        expect(profile).to be_valid
      end
      
      it 'is invalid document' do
        profile.document = '00000000000'
        
        expect(profile).not_to be_valid
        expect(profile.errors[:document]).to include('Invalid Document')
      end
    end

    context 'when document already exists' do
      it do
        subject.document = '12345678900'
        subject.save!
  
        subject.document = '98765432100'

        subject.send(:verify_document)

        expect(subject.errors[:document]).to include('Document already exists')
      end
    end
  end
end
