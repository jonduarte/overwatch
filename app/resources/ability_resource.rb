class AbilityResource < JSONAPI::Resource
  belongs_to :hero
  attributes :api_id, :name, :description, :is_ultimate, :hero_id
end
