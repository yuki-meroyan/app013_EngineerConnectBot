require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'app013storage'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/app013storage'

  else
    config.storage  = :file
    config.asset_host = 'http://localhost:3000/'
  end
end