CarrierWave.configure do |config|
  if Rails.env.production?
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
    config.fog_credentials = {
      provider:              'AWS', # required
      aws_access_key_id:     => ENV['S3_ACCESS_KEY'], # required
      aws_secret_access_key: => ENV['S3_SECRET_KEY'], # required
      region:                'us-west-1', # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['S3_Bucket'] # required
    config.fog_public     = true # optional, defaults to true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
  end
end
