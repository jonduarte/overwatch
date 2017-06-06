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

  describe "#hero" do
    let(:hero) { ability.hero }

    before do
      stub_request(:get, "https://overwatch-api.net/api/v1/ability/1").
        to_return(status: 200, body: File.read("spec/fixtures/overwatch/ability.json"))
      stub_request(:get, "https://overwatch-api.net/api/v1/hero/1").
        to_return(status: 200, body: File.read("spec/fixtures/overwatch/hero.json"))
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

    describe "#abilities" do
      subject { hero.abilities.size }
      it { is_expected.to eq(4) }
    end
  end
end
