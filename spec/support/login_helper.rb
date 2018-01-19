def login
  let!(:user) { FactoryBot.create(:user) }
  let!(:set_cookie) { request.cookies.merge!(auth_token: user.auth_token) }
end