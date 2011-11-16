CarrierWave.configure do |config|
  config.storage              = :s3
  config.s3_access_policy     = :public_read
  config.s3_access_key_id = 'AKIAJCTGNYPQ2HD2KUGA'
  config.s3_secret_access_key = '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'
  config.s3_bucket = 'mobstone'
end