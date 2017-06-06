module Overwatch
  class Ability < Hashie::Mash
    def hero
      Hero.new(Client.new.ability(id)[:hero])
    end
  end
end
