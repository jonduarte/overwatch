module Overwatch
  class Hero < Hashie::Mash
    def abilities
      Client.new.hero(id)[:abilities].collect do |ability|
        Overwatch::Ability.new(ability)
      end
    end
  end
end
