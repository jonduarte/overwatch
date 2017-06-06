class Ability < ApplicationRecord
  belongs_to :hero
  validates :api_id, :name, :description, presence: true
end
