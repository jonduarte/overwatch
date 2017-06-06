require 'rails_helper'

describe Overwatch::Hero do
  let(:client) { Overwatch::Client.new }
  let(:abilities) { client.abilities }
  let(:ability) { abilities.first }

  before do
    stub_request(:get, "https://overwatch-api.net/api/v1/ability").
      to_return(status: 200, body: File.read('spec/fixtures/overwatch/abilities.json'))
  end

  describe "#name" do
    subject { ability.name }
    it { is_expected.to eq "Biotic Rifle" }
  end

  describe "#id" do
    subject { ability.id }
    it { is_expected.to eq 1 }
  end

  describe "#is_ultimate" do
    subject { ability.is_ultimate }
    it { is_expected.to eq false }
  end
end
