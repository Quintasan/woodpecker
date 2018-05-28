# frozen_string_literal: true

require 'time'

module Woodpecker
  class Campaign
    attr_accessor :id, :name, :status, :from_name, :from_email, :created

    def initialize(campaign)
      @id = campaign[:id]
      @name = campaign[:name]
      @status = campaign[:status]
      @from_name = campaign[:from_name]
      @from_email = campaign[:from_email]
      @created = Time.parse(campaign[:created])
    end
  end
end
