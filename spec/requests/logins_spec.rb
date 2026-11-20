RSpec.describe 'Logins', type: :request do
  describe 'POST /logins' do
    let!(:user) { create(:user, password: 'secret123', password_confirmation: 'secret123') }

    it 'signs in with valid credentials' do
      expect {
        post logins_path, params: { email: user.email, password: 'secret123' }
      }.to change(Login, :count).by(1)

      expect(response).to redirect_to(edit_profile_path(user.profile))
      expect(session[:user_id]).to eq(user.id)
    end

    it 'rotates the session id on sign in' do
      get new_login_path
      old_session_id = session.id.to_s

      post logins_path, params: { email: user.email, password: 'secret123' }

      expect(session.id.to_s).not_to eq(old_session_id)
    end

    it 'rejects a wrong password' do
      post logins_path, params: { email: user.email, password: 'wrong' }

      expect(response).to have_http_status(:unprocessable_content)
      expect(session[:user_id]).to be_nil
    end

    it 'rejects an unknown e-mail' do
      expect {
        post logins_path, params: { email: 'nobody@example.com', password: 'secret123' }
      }.not_to change(Login, :count)

      expect(response).to have_http_status(:unprocessable_content)
      expect(session[:user_id]).to be_nil
    end
  end

  describe 'GET /auth/google_oauth2/callback' do
    let(:email) { 'google.user@gmail.com' }
    let(:email_verified) { true }

    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: '123456',
        info: { email: email, name: 'Google User' },
        extra: { raw_info: { email_verified: email_verified } }
      )
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    after do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      Rails.application.env_config.delete('omniauth.auth')
      OmniAuth.config.test_mode = false
    end

    it 'creates the user and signs in' do
      expect {
        get '/auth/google_oauth2/callback'
      }.to change(User, :count).by(1).and change(Login, :count).by(1)

      user = User.find_by(email: email)
      expect(user).to have_attributes(provider: 'google_oauth2', uid: '123456')
      expect(session[:user_id]).to eq(user.id)
      expect(response).to redirect_to(edit_profile_path(user.profile))
    end

    it 'links an existing account with the same e-mail' do
      existing = create(:user, email: email)

      expect { get '/auth/google_oauth2/callback' }.not_to change(User, :count)

      expect(existing.reload.uid).to eq('123456')
      expect(session[:user_id]).to eq(existing.id)
    end

    context 'when the e-mail is not verified' do
      let(:email_verified) { false }

      it 'does not sign in' do
        expect { get '/auth/google_oauth2/callback' }.not_to change(User, :count)

        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(new_login_path)
      end
    end
  end

  describe 'GET /auth/failure' do
    it 'shows a cancel message when access is denied' do
      get '/auth/failure', params: { message: 'access_denied', strategy: 'google_oauth2' }

      expect(response).to redirect_to(new_login_path)
      expect(flash[:alert]).to eq('Login com Google cancelado.')
    end

    it 'shows a generic message for other errors' do
      get '/auth/failure', params: { message: 'invalid_credentials', strategy: 'google_oauth2' }

      expect(flash[:alert]).to eq('Não foi possível entrar com o Google.')
    end
  end
end
