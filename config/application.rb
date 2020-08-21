require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CouponThedogpawsCom
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :delete]
      end
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.api_only = false
    config.load_defaults 5.2
    config.active_job.queue_adapter = :sidekiq
    config.time_zone = 'Pacific Time (US & Canada)'
  end
end