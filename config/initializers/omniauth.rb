OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '668259219966005', '8413080ceaf99e7afa83bc8c5de22f38'
end
