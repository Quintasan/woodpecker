require_relative '../spec_helper.rb'

describe Woodpecker::Configuration do
  before do
    Woodpecker.configure do |config|
      config.api_key = 'test'
      config.dummy_password = 'test'
    end
  end

  it 'returns the API key' do
    Woodpecker.configuration.api_key.must_equal 'test'
  end

  it 'return the dummy password' do
    Woodpecker.configuration.dummy_password.must_equal 'test'
  end

  describe '#reset' do
    it 'resets the configuration' do
      Woodpecker.configure do |config|
        config.api_key = 'test'
        config.dummy_password = 'test'
      end

      Woodpecker.reset

      proc { Woodpecker.configuration.api_key }.must_raise Woodpecker::Errors::Configuration
      proc { Woodpecker.configuration.dummy_password }.must_raise Woodpecker::Errors::Configuration
    end
  end
end
