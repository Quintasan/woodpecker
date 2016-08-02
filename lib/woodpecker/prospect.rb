module Woodpecker
  class Prospect
    VALID_STATUSES = %w(active replied bounced autoreplied invalid blacklist).freeze
    ATTRS = [:email, :status, :first_name, :last_name, :tags, :company,
             :industry, :title, :phone, :address, :city, :state, :country, :website,
             :snipet1, :snipet2, :snipet3, :snipet4].freeze

    attr_accessor(*ATTRS)

    def initialize(prospect)
      @email = prospect[:email]
      raise Errors::Prospect, "Invalid status, valid states are: #{VALID_STATUSES}." unless VALID_STATUSES.include?(prospect[:status])
      @status = prospect[:status].upcase
      @first_name = prospect[:first_name] || ''
      @last_name = prospect[:last_name] || ''
      @tags = prospect[:tags] || ''
      @company = prospect[:company] || ''
      @industry = prospect[:industry] || ''
      @title = prospect[:title] || ''
      @phone = prospect[:phone] || ''
      @address = prospect[:address] || ''
      @city = prospect[:city] || ''
      @state = prospect[:state] || ''
      @country = prospect[:country] || ''
      @website = prospect[:website] || ''
      @snipet1 = prospect[:snipet1] || ''
      @snipet2 = prospect[:snipet2] || ''
      @snipet3 = prospect[:snipet3] || ''
      @snipet4 = prospect[:snipet4] || ''
    end

    def email
      raise Errors::Prospect, 'Missing email' unless @email
      @email
    end

    def to_h
      hash = {}
      ATTRS.each do |attr|
        hash[attr.to_sym] = send(attr)
      end
      hash
    end

    def to_json(*_args)
      to_h.to_json
    end
  end
end
