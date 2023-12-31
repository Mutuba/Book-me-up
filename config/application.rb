require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookme
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.autoload_paths += %W(#{config.root}/lib)
    config.generators.system_tests = nil
    config.i18n.available_locales = [:en, :de, :fr]
    config.i18n.default_locale = :en
    config.beginning_of_week = :sunday
    config.assets.precompile += %w( simple_calendar_custom.css )

    config.geocoder = {
      ip_lookup: :maxmind,
      maxmind: {
        service: :city,
        basic_auth: {
          username: ENV['MAX_MIND_ACCOUNT_ID'],
          password: ENV['MAX_MIND_LICENSE_KEY']
        }
      }
    }
  end
end
