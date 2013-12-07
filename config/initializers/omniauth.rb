OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '264954566962507', '411bcad542f30ba7ede5e0a7febdfac7'
end