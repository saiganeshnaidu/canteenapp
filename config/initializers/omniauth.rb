Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end



Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '3292964137655412', '512d2da75134b740678bbe6aed8fd392',
  scope: 'email,read_stream', display: 'popup'

end
OmniAuth.config.allowed_request_methods = %i[get]


Rails.application.config.middleware.insert_before(OmniAuth::Builder, RescueAuthTokenFromOmniauth)
