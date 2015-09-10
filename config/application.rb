require File.expand_path('../boot', __FILE__)

require 'rails'

%w(
    neo4j
    action_controller
    action_mailer
    sprockets
).each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TripFinder
  class Application < Rails::Application

    Dir[Rails.root.join("lib/**/*.rb")].each {|f| require f}

    config.eager_load = true

    config.neo4j.session_type = :server_db
    config.neo4j.session_path = ENV['GRAPHENEDB_URL'] || 'http://localhost:7474'
    config.neo4j.session_options = { basic_auth: { username: 'neo4j', password: 'admin' } }

  end
end
