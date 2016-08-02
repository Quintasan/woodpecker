require 'json'
require 'typhoeus'

require 'woodpecker/version'

require 'woodpecker/configuration'
require 'woodpecker/errors/configuration'

require 'woodpecker/utils/request'

require 'woodpecker/campaign'
require 'woodpecker/prospect'
require 'woodpecker/errors/prospect'

require 'pry'

module Woodpecker
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.campaign_list
    Woodpecker::Utils::Request.get('campaign_list').map { |campaign| Campaign.new(campaign) }
  end

  def self.add_prospects_campaign(campaign_id, params = {}, prospects)
    payload = { campaign: { campaign_id: campaign_id },
                update: 'true',
                prospects: Array(prospects) }.to_json
    Woodpecker::Utils::Request.post('add_prospects_campaign', params, payload)
  end

  def self.add_prospects_list(params = {}, prospects)
    payload = { update: 'true', prospects: Array(prospects) }.to_json
    Woodpecker::Utils::Request.post('add_prospects_list', params, payload)
  end

  def self.stop_followups(params = {}, prospect)
    payload = { prospect: { email: prospect.email } }.to_json
    Woodpecker::Utils::Request.post('stop_followups', params, payload)
  end
end
