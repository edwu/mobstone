CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.s3_access_key_id = ENV['AKIAJCTGNYPQ2HD2KUGA']
  config.s3_secret_access_key = ENV['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']
  config.s3_bucket = ENV['mobstone']
end

