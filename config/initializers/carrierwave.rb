CarrierWave.configure do |config|

  if Rails.env.production? || Rails.env.development?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: ENV['S3_REGION'],
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
