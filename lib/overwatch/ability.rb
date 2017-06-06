module Overwatch
  class Ability < Hashie::Mash
    def hero
      Overwatch::Hero.new(Client.new.ability(id)[:hero])
    end
  end
end
