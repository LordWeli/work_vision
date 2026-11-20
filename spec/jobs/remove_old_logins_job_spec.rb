RSpec.describe RemoveOldLoginsJob, type: :job do
  let(:user) { create(:user) }

  it 'deletes logins older than the retention period' do
    old_login = Login.create!(user: user, provider: 'password', created_at: 61.days.ago)
    recent_login = Login.create!(user: user, provider: 'password', created_at: 59.days.ago)

    described_class.perform_now

    expect(Login.exists?(old_login.id)).to be(false)
    expect(Login.exists?(recent_login.id)).to be(true)
  end
end
