# frozen_string_literal: true

require 'spec_helper'

describe Woodpecker::Configuration do
  describe "with dummy_password provided" do
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

        Woodpecker.configuration.dummy_password.must_equal 'X'
        proc { Woodpecker.configuration.api_key }.must_raise Woodpecker::Errors::Configuration
      end
    end

    after do
      Woodpecker.reset
    end
  end

  describe "without dummy_password provided" do
    before do
      Woodpecker.configure do |config|
        config.api_key = 'test'
      end
    end

    it "returns 'test' as API key" do
      Woodpecker.configuration.api_key.must_equal 'test'
    end

    it "returns 'X' as dummy password" do
      Woodpecker.configuration.dummy_password.must_equal 'X'
    end

    after do
      Woodpecker.reset
    end
  end
end
