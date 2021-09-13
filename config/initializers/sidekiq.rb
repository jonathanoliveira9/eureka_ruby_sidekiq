hash_params = {
  url: "redis://#{ENV['URL_REDIS']}:6379/0"
}

Sidekiq.configure_server do |config|
  config.redis = hash_params
end

Sidekiq.configure_client do |config|
  config.redis = hash_params
end
