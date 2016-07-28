CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production? || Rails.env.development?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_credentials = {
    :provider               => 'AWS',                             # required
    :aws_access_key_id      => ENV["AMAZON_ID"],            # required
    :aws_secret_access_key  => ENV["AMAZON_SECRET"],     # required
  }
  config.fog_directory  = ENV["AMAZON_BUCKET"]               # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
end
