CarrierWave.configure do |config|

  if Rails.env.production? || Rails.env.development?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION'],
      path_style: true,
    }
    config.fog_directory = ENV['S3_BUCKET_NAME']
    config.storage :fog
    config.asset_host = ENV['S3_ASSET_HOST']
    config.fog_public = false
  else
    config.storage :file
  end
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
