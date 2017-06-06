require 'rails_helper'

describe PopulateHeroes do
  let(:service) { described_class.new }

  before do
    stub_request(:get, "https://overwatch-api.net/api/v1/hero").
      to_return(status: 200, body: File.read('spec/fixtures/overwatch/one_hero.json'))
    stub_request(:get, "https://overwatch-api.net/api/v1/ability").
      to_return(status: 200, body: File.read('spec/fixtures/overwatch/abilities.json'))
      stub_request(:get, "https://overwatch-api.net/api/v1/hero/1").
        to_return(status: 200, body: File.read("spec/fixtures/overwatch/hero.json"))
  end

  it "creates all heroes" do
    expect { service.run }.to change { Hero.count }.by(1)
  end

  it "creates all abilities" do
    expect { service.run }.to change { Ability.count }.by(4)
  end

  describe "hero details" do
    before { service.run }
    let(:hero) { Hero.find_by(api_id: 1) }

    context "#name" do
      subject { hero.name }
      it { is_expected.to eq("Ana") }
    end

    context "#abilities" do
      let(:abilities) { hero.abilities }
      let(:ability) { abilities.first }

      describe "#name" do
        subject { ability.name }
        it { is_expected.to eq("Biotic Rifle") }
      end
    end
  end
end
