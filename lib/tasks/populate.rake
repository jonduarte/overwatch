namespace :populate do
  desc "Populate heroes from OverwatchAPI"
  task heroes: :environment do
    PopulateHeroes.new.run
  end
end
