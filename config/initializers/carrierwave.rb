CarrierWave.configure do |config|
  
  #config.cache_storage = :fog #キャッシュの場所をS3に変更
  
  config.root = Rails.root.join('tmp')
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: 'ap-northeast-1'
  }
  config.cache_storage = :fog
  
  config.storage = :fog
  config.fog_directory = "micropost-okubo"
  config.fog_public = true
  
  
  
  #config.fog_authenticated_url_expiration = 60

  #case Rails.env
  #  when 'production'
  #    config.fog_directory = 'test'
  #    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test'

  #  when 'development'
  #    config.fog_directory = 'dev.test'
  #    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.test'

  #  when 'test'
  #    config.fog_directory = 'test.test'
  #    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.test'
  #end
end