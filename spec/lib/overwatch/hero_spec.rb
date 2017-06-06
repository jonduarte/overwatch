require 'rails_helper'

describe Overwatch::Hero do
  let(:client) { Overwatch::Client.new }
  let(:heroes) { client.heroes }
  let(:hero) { heroes.first }

  before do
    stub_request(:get, "https://overwatch-api.net/api/v1/hero").
      to_return(status: 200, body: File.read('spec/fixtures/overwatch/heroes.json'))
  end

  describe "#name" do
    subject { hero.name }
    it { is_expected.to eq "Ana" }
  end

  describe "#id" do
    subject { hero.id }
    it { is_expected.to eq 1 }
  end

  describe "#real_name" do
    subject { hero.real_name }
    it { is_expected.to eq "Ana Amari" }
  end

  describe "#health" do
    subject { hero.health }
    it { is_expected.to eq 200 }
  end

  describe "#armour" do
    subject { hero.armour }
    it { is_expected.to eq 0 }
  end

  describe "#shield" do
    subject { hero.shield }
    it { is_expected.to eq 0 }
  end
end
