require 'spec_helper'

describe Woodpecker::Campaign do
  it "parses 'almost' ISO8601 correctly" do
    campaign_hash = {
      created: "2018-05-17T12:17:11+0200"
    }
    campaign = Woodpecker::Campaign.new(campaign_hash)
    campaign.created.must_equal(
      Time.new(2018, 5, 17, 12, 17, 11, "+02:00")
    )
  end
end
