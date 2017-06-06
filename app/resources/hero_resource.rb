class HeroResource < JSONAPI::Resource
  has_many :abilities
  attributes :name, :real_name, :health, :armour, :shield, :api_id
end
