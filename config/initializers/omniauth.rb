Rails.application.config.middleware.use OmniAuth::Builder do
  provider :azure_oauth2,
    client_id: '',
    client_secret: '',
    tenant_id: ''
end
