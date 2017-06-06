class PopulateHeroes
  def run
    Overwatch::Client.new.heroes.each do |api_hero|
      ActiveRecord::Base.transaction do
        Hero.where(api_id: api_hero.id).first_or_initialize do |hero|
          hero.name = api_hero.name
          hero.real_name = api_hero.real_name
          hero.health = api_hero.health
          hero.armour = api_hero.armour
          hero.shield = api_hero.shield
          hero.save!

          api_hero.abilities.each do |api_ability|
            Ability.where(api_id: api_ability.id).first_or_initialize do |ability|
              ability.name = api_ability.name
              ability.description = api_ability.description
              ability.is_ultimate = api_ability.is_ultimate
              ability.hero = hero
              ability.save!
            end
          end
        end
      end
    end
  end
end
