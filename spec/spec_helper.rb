# frozen_string_literal: true

def mongoid7?
  Gem::Version.new(Mongoid::VERSION) >= Gem::Version.new("7.0.0")
end

require "mongoid/association_scope"

ENV["MONGOID_ENV"] ||= "test"

Dir[File.expand_path("support/**/*.rb", __dir__)].sort.each { |f| require f }

Mongoid.load!(File.expand_path("support/config/mongoid.yml", __dir__))

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:example) do
    [Like, Post, User].each { |m| m.delete_all }
  end
end
