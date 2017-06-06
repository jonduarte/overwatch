class Ability < ApplicationRecord
  belongs_to :hero
  validates :api_id, :name, :description, :is_ultimate, presence: true
end
