class Hero < ApplicationRecord
  has_many :abilities

  validates :api_id, :name, :real_name, :health, :armour, :shield, presence: true
end
