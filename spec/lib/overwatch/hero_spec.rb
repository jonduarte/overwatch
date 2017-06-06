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

  describe "#abilities" do
    let(:ability) { hero.abilities.first }

    before do
      stub_request(:get, "https://overwatch-api.net/api/v1/hero/1").
        to_return(status: 200, body: File.read("spec/fixtures/overwatch/hero.json"))
    end

    describe "#id" do
      subject { ability.id }
      it { is_expected.to eq 1 }
    end

    describe "#name" do
      subject { ability.name }
      it { is_expected.to eq "Biotic Rifle" }
    end

    describe "#description" do
      subject { ability.description }
      it { is_expected.to eq "Ana\u2019s rifle shoots darts that can restore health to her allies or deal ongoing damage to her enemies. She can use the rifle\u2019s scope to zoom in on targets and make highly accurate shots." }
    end

    describe "#is_ultimate" do
      subject { ability.is_ultimate }
      it { is_expected.to eq(false)  }
    end
  end
end
