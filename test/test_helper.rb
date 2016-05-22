SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/spec'
require 'minispec-metadata'
require 'vcr'
require 'minitest-vcr'
require 'webmock/minitest'
require 'minitest/reporters'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
MinitestVcr::Spec.configure!

class ActiveSupport::TestCase
  fixtures :all

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:spotify_known] = OmniAuth::AuthHash.new( { provider: 'spotify', info: { id: "known_user", display_name: "known user" } })

  OmniAuth.config.mock_auth[:spotify_unknown] = OmniAuth::AuthHash.new( { provider: 'spotify', info: { id: "dri19tcc", display_name: "Adriana Cannon" } })

  OmniAuth.config.mock_auth[:spotify_uid] = OmniAuth::AuthHash.new( { provider: 'spotify', uid: "preferred", info: { id: "not", display_name: " " } })
end
